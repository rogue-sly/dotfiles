{
  description = "Rogue's toolbelt";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

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
          btop
          curl
          devenv
          fd
          gopass
          jq
          lazygit
          lf
          monolith
          neovim
          netwatch
          ripgrep
          sabiql
          speedtest-go
          tealdeer
          tree
          trufflehog
          usql
          vm-curator
          wrkflw
          zoxide
        ];

      lsp =
        pkgs: with pkgs; [
          lua-language-server
          nixd
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
