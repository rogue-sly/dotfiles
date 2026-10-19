 {
  description = "Rogue's toolbelt";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    dotbee = {
      url = "github:rogue-sly/dotbee";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, dotbee, self }: let
    systems = [ "x86_64-linux" ];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system:
      f system (import nixpkgs { inherit system; config.allowUnfree = true; }));

    tools = pkgs: with pkgs; [
      # cli/tui
      btop
      curl
      fd
      jq
      lazygit
      lf
      ripgrep
      tealdeer
      tree
      zoxide
      nixfmt
      nixd

      # was mise [tools]
      gopass
      monolith
      netwatch
      sabiql
      speedtest-go
      trufflehog
      usql
      vm-curator
      wrkflw

      # was mise conf.d (nvim LSPs/formatters)
      lua-language-server
      # mesonlsp
      # neocmakelsp
      oxfmt
      oxlint
      # roslyn-ls
      # slint-lsp
      # slint-viewer
      stylua
      texlab
      tinymist
      tombi
      websocat
    ];
  in {
    packages = forAllSystems (system: pkgs: {
      dotbee = dotbee.packages.${system}.default;

      default = pkgs.buildEnv {
        name = "rogue-tools";
        paths = [ self.packages.${system}.dotbee ] ++ tools pkgs;
        ignoreCollisions = true;
      };
    });
  };
}
