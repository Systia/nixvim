{
  imports = [
    ./options.nix
    ./keymaps.nix

    ./plugins/colorscheme.nix

    ./ftplugin/nix.nix

    ./plugins/treesitter.nix
    ./plugins/which-key.nix
    ./plugins/indent-blankline.nix
    ./plugins/mini.nix
    ./plugins/lualine.nix
    ./plugins/comment-nvim.nix
    ./plugins/lsp.nix
    ./plugins/none-ls.nix
    ./plugins/luasnip.nix
    ./plugins/cmp.nix
    ./plugins/telescope.nix
  ];

  viAlias = true;
  vimAlias = true;
}
