{
  description = "Systia's NixVim configuration";

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      imports = [ ./pre-commit-hooks.nix ];

      perSystem =
        { config, pkgs, ... }:
        let
          inherit (inputs) nixvim;
          nixvimLib = nixvim.lib.${pkgs.system};
          nvim = nixvim.legacyPackages.${pkgs.system}.makeNixvimWithModule {
            inherit pkgs;
            module = ./config;
          };
        in
        {
          packages.default = nvim;

          checks.default = nixvimLib.check.mkTestDerivationFromNvim {
            inherit nvim;
            name = "NixVim check";
          };

          devShells.default = pkgs.mkShell {
            name = "nixvim";
            packages = with pkgs; [
              nixfmt-rfc-style
              git
            ];
            shellHook = ''
              ${config.pre-commit.installationScript}
            '';
          };

          formatter = pkgs.nixfmt-rfc-style;
        };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
