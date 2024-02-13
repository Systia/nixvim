{
  plugins.telescope = {
    enable = true;
    extensions = {
      ui-select.enable = true;
      undo.enable = true;
    };
    keymaps = {
      "<leader>fg" = "live_grep";
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>u";
      action = "<cmd>Telescope undo<CR>";
      options. desc = "Telescope undo tree";
    }
  ];
}
