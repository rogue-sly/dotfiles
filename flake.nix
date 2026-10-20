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

      cli =
        pkgs: with pkgs; [
          binsider
          curl
          delta
          devenv
          fastfetch
          fd
          gopass
          jq
          lazygit
          lf
          monolith
          netwatch
          ripgrep
          speedtest-go
          tealdeer
          tectonic
          tree
          trufflehog
          typst
          usql
          vm-curator
          wrkflw
          zoxide
        ];

      lsp =
        pkgs: with pkgs; [
          lua-language-server
          nixd
          # doc
          texlab
          tinymist
          tombi
          websocat
        ];

      fmt =
        pkgs: with pkgs; [
          nixfmt
          oxfmt
          stylua
          typstyle
        ];

      lint =
        pkgs: with pkgs; [
          selene
        ];

    in
    {
      packages = forAllSystems (
        system: pkgs: {
          dotbee = dotbee.packages.${system}.default;
          default = pkgs.buildEnv {
            name = "rogue-tools";
            paths = [ self.packages.${system}.dotbee ] ++ cli pkgs ++ lsp pkgs ++ fmt pkgs ++ lint pkgs;
            ignoreCollisions = true;
          };
        }
      );
    };
}
