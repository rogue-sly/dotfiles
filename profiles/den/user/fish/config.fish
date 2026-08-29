# disable annoying greeting
set -U fish_greeting

# env vars
set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/config"
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER ov
set -gx GIT_PAGER delta

# paths
fish_add_path ~/.local/bin # user installed programs
fish_add_path ~/.dotnet/tools # dotnet tools

if status is-interactive
    # aliases
    alias zj=zellij
end
