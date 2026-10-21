{
  description = "Rogue's toolbelt";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # my beloved dotfiles manager
    dotbee = {
      url = "github:rogue-sly/dotbee";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      dotbee,
    }:
    let
      systems = [ "x86_64-linux" ];
      forAllSystems =
        f:
        nixpkgs.lib.genAttrs systems (
          system:
          f system (
            import nixpkgs {
              inherit system;
              config.allowUnfree = true;
            }
          )
        );

      shell = # things that are integrated into the shell rather than used directly as clis
        pkgs: with pkgs; [
          bat
          bat-extras.core
          delta
          devenv
          direnv
          fd
          fish
          lf
          ripgrep
          tectonic
          zellij
          zoxide
        ];

      nvim = # neovim + other components for proper workflow
        pkgs: with pkgs; [
          git
          lazygit
          neovim
          sqlite
          tree-sitter
        ];

      cli = # cli tools
        pkgs: with pkgs; [
          fastfetch
          gopass
          jq
          monolith
          speedtest-go
          tealdeer
          tree
          trufflehog
          typst
          usql
        ];

      tui = # tui tools
        pkgs: with pkgs; [
          binsider
          netwatch
          vm-curator
          wrkflw
        ];

      lsp = # language servers
        pkgs: with pkgs; [
          lua-language-server
          nixd
          tombi
          # doc
          texlab
          tinymist
          websocat
        ];

      fmt = # formatters
        pkgs: with pkgs; [
          nixfmt
          oxfmt
          shellcheck
          shfmt
          stylua
          typstyle
        ];

      lint = # linters
        pkgs: with pkgs; [
          selene
        ];

    in
    {
      packages = forAllSystems (
        system: pkgs: {
          dotbee = dotbee.packages.${system}.default;
          default = pkgs.buildEnv {
            name = "rogue";
            paths = [
              self.packages.${system}.dotbee
            ]
            ++ cli pkgs
            ++ fmt pkgs
            ++ lint pkgs
            ++ lsp pkgs
            ++ nvim pkgs
            ++ shell pkgs
            ++ tui pkgs;
            ignoreCollisions = true;
          };
        }
      );
    };
}
