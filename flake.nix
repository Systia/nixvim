{
  description = "Systia's NixVim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixvim, flake-parts, pre-commit-hooks, ... } @ inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      perSystem = { self', pkgs, system, lib, ... }:
        let
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nvim = nixvim'.makeNixvimWithModule {
            inherit pkgs;
            module = ./config;
          };
        in
        {
          checks = {
            default = nixvimLib.check.mkTestDerivationFromNvim {
              inherit nvim;
              name = "Systia's NixVim configuration";
            };
            pre-commit-check = pre-commit-hooks.lib.${system}.run {
              src = ./.;
              hooks = {
                nil.enable = true;
                statix.enable = true;
                nixpkgs-fmt.enable = true;
              };
            };
          };

          formatter = pkgs.nixpkgs-fmt;

          packages = {
            default = nvim;
          };

          devShells = {
            default = with pkgs;
              mkShell {
                inherit (self'.checks.pre-commit-check) shellHook;
              };
          };
        };
    };
}
