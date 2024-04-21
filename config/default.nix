{
  imports = [
    ./options.nix
    ./keymaps.nix

    ./ftplugin/nix.nix

    ./plugins
  ];

  viAlias = true;
  vimAlias = true;
}
