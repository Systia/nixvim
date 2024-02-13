# NixVim configuration

My Neovim config with [NixVim](https://github.com/nix-community/nixvim).

## Installation using flakes

```nix
{
  inputs = {
    nixvim.url = "github:Systia/nixvim";
  };
}
```

## Usage

### Without flakes

From the repository

```
nix run .
```

From anywhere

```
nix run github:Systia/nixvim
```

### Using flakes

Add `inputs.nixvim.packages.${system}.default` to the packages

```nix
{ inputs, system, ... }:
{
  # NixOS
  environment.systemPackages = [
    inputs.nixvim.packages.${system}.default
  ];

  # home-manager
  home.packages = [
    inputs.nixvim.packages.${system}.default
  ];
}
```

## Configuration

Edit or add files in `./config`. New files need to be imported in
`./config/default.nix` to be working

## Credits

- [elythh](https://github.com/elythh/nixvim) - for the code
