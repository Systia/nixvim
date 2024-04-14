{
  config = {
    opts = {
      number = true;
      relativenumber = true;

      tabstop = 4;
      softtabstop = 4;
      expandtab = true;
      smarttab = true;

      shiftwidth = 4;
      smartindent = true;

      breakindent = true;

      wrap = true;

      ignorecase = true;
      smartcase = true;

      completeopt = [
        "menuone"
        "preview"
        "noinsert"
        "noselect"
      ];

      swapfile = false;
      backup = false;
      undofile = true;

      cursorline = true;

      scrolloff = 8;

      timeoutlen = 300;

      showmode = false;
    };

    clipboard.register = "unnamedplus";
  };
}
