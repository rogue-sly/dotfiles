#!/usr/bin/env python3
"""
setup-fedora.py -- Fedora workstation bootstrap script

Usage:
    sudo python3 setup-fedora.py          # run everything
    python3 setup-fedora.py --dry-run     # print commands without executing

Sections:
    1. Add repositories and COPRs
    2. Configure DNF
    3. Install packages and update system
    4. Setup dotfiles (via dotbee)

Requires: Python 3.8+, Fedora 44+
"""

import argparse
import os
import subprocess
from typing import Sequence

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------


def info(msg: str) -> None:
    print(f"\n\033[1;34m==>\033[0m \033[1m{msg}\033[0m")


def warn(msg: str) -> None:
    print(f"\033[1;33m==>\033[0m \033[1m{msg}\033[0m")


def run(
    cmd: Sequence[str | os.PathLike[str]],
    *,
    sudo: bool = False,
    check: bool = True,
    capture: bool = False,
    dry_run: bool = False,
) -> subprocess.CompletedProcess | None:
    full_cmd: list[str] = []
    if sudo:
        full_cmd.append("sudo")
    full_cmd.extend(str(c) for c in cmd)

    if dry_run:
        print(f"  [DRY-RUN] $ {' '.join(full_cmd)}")
        return None

    if capture:
        return subprocess.run(full_cmd, capture_output=True, text=True, check=check)

    return subprocess.run(full_cmd, check=check)


def get_fedora_release() -> str:
    result = run(["rpm", "-E", "%fedora"], capture=True)
    if result is None:
        raise RuntimeError("failed to get Fedora release version")
    return result.stdout.strip()


# ---------------------------------------------------------------------------
# 1. REPOSITORIES & COPRS
# ---------------------------------------------------------------------------


def add_repositories(dry_run: bool = False) -> None:
    info("Adding repositories and COPRs...")

    release = get_fedora_release()

    # RPM Fusion free
    run(
        [
            "dnf",
            "install",
            "-y",
            f"https://mirrors.rpmfusion.org/free/fedora/"
            f"rpmfusion-free-release-{release}.noarch.rpm",
        ],
        sudo=True,
        dry_run=dry_run,
    )
    # RPM Fusion non-free
    run(
        [
            "dnf",
            "install",
            "-y",
            f"https://mirrors.rpmfusion.org/nonfree/fedora/"
            f"rpmfusion-nonfree-release-{release}.noarch.rpm",
        ],
        sudo=True,
        dry_run=dry_run,
    )
    # Terra
    run(
        [
            "dnf",
            "install",
            "--nogpgcheck",
            "--repofrompath",
            f"terra,https://repos.fyralabs.com/terra{release}",
            "terra-release",
        ],
        sudo=True,
        dry_run=dry_run,
    )

    # COPRs
    coprs = [
        # "agriffis/neovim-nightly",
        "brycensranch/gpu-screen-recorder-git",
        "roguedotsly/mprisence",
        "roguedotsly/pixelorama",
        "roguedotsly/trenchbroom",
    ]

    for copr in coprs:
        run(["dnf", "copr", "enable", "-y", copr], sudo=True, dry_run=dry_run)


# ---------------------------------------------------------------------------
# 2. CONFIGURE DNF
# ---------------------------------------------------------------------------


def configure_dnf(dry_run: bool = False) -> None:
    info("Configuring DNF...")
    run(
        ["dnf", "config-manager", "setopt", "fedora-cisco-openh264.enabled=1"],
        sudo=True,
        dry_run=dry_run,
    )


# ---------------------------------------------------------------------------
# 3. PACKAGES
# ---------------------------------------------------------------------------

SYSTEM_PACKAGES: list[str] = [
    # Commandline tools
    "btop",
    "curl",
    "fastfetch",
    "fd-find",
    "fish",
    "fzf",
    "git",
    "jq",
    "mise",
    "neovim",
    "neovim-default-editor",
    "ripgrep",
    "tealdeer",
    "tree",
    "unzip",
    "wget",
    "which",
    "zellij",
    "zoxide",
    # Programming language tools
    "luarocks",
    "nodejs",
    "python3-pip",
    "python3-uv",
    "rustup",
    # GUI
    "alacritty",
    "codium",
    "codium-marketplace",
    "easyeffects",
    "fooyin",
    "godot",
    "haruna",
    "heroic-games-launcher",
    "kitty",
    "neovide",
    "pixelorama",
    "protontricks",
    "steam",
    # Daemons
    "mprisence",
]


def install_packages(dry_run: bool = False) -> None:
    info("Updating system...")
    run(["dnf", "upgrade", "-y", "--refresh"], sudo=True, dry_run=dry_run)

    info("Installing packages...")
    # Install in batches to keep command lines reasonable
    batch_size = 30
    for i in range(0, len(SYSTEM_PACKAGES), batch_size):
        batch = SYSTEM_PACKAGES[i : i + batch_size]
        run(["dnf", "install", "-y", *batch], sudo=True, dry_run=dry_run)

    # Cleanup
    run(["dnf", "autoremove", "-y"], sudo=True, dry_run=dry_run)
    run(["dnf", "clean", "all"], sudo=True, dry_run=dry_run)


# ---------------------------------------------------------------------------
# 4. DOTFILES
# ---------------------------------------------------------------------------


def setup_dotfiles(dry_run: bool = False) -> None:
    info("Setting up dotfiles...")

    if dry_run:
        print("  [DRY-RUN] dotbee switch --profile den")
        return

    run(["dotbee", "switch", "--profile", "den"])


# ---------------------------------------------------------------------------
# MAIN
# ---------------------------------------------------------------------------


def parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Fedora workstation bootstrap script",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__,
    )

    parser.add_argument(
        "--dry-run",
        "-n",
        action="store_true",
        help="Print commands without executing them",
    )

    parser.add_argument(
        "--skip-repos",
        action="store_true",
        help="Skip section 1 (repositories / COPRs)",
    )

    parser.add_argument(
        "--skip-configure-dnf",
        action="store_true",
        help="Skip section 2 (configure dnf)",
    )

    parser.add_argument(
        "--skip-packages",
        action="store_true",
        help="Skip section 3 (package installation)",
    )

    parser.add_argument(
        "--skip-dotfiles",
        action="store_true",
        help="Skip section 4 (dotfile setup)",
    )

    parser.add_argument(
        "--only",
        choices=["repos", "configure-dnf", "packages", "dotfiles"],
        help="Run only a single section",
    )

    return parser.parse_args(argv)


def main() -> None:
    args = parse_args()
    dry_run = args.dry_run

    # Run sections based on flags
    sections = []

    if args.only:
        # Single-section mode
        sections = [args.only]
    else:
        ordered = ["repos", "configure-dnf", "packages", "dotfiles"]
        skip_map = {
            "repos": args.skip_repos,
            "configure-dnf": args.skip_configure_dnf,
            "packages": args.skip_packages,
            "dotfiles": args.skip_dotfiles,
        }
        sections = [s for s in ordered if not skip_map[s]]

    section_map = {
        "repos": add_repositories,
        "configure-dnf": configure_dnf,
        "packages": install_packages,
        "dotfiles": setup_dotfiles,
    }

    for section in sections:
        section_map[section](dry_run=dry_run)

    # Summary
    info("Fedora setup complete!")
    print()
    print("Next steps:")
    print("  1. Restart your shell or run:  exec fish")
    print("  2. Verify dotfiles:            dotbee doctor")
    print("  3. Reboot (recommended) to pick up kernel/driver updates.")


if __name__ == "__main__":
    main()
