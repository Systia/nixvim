{
  plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    sources = {
      code_actions = {
        statix.enable = true;
      };
      diagnostics = {
        statix.enable = true;
      };
      formatting = {
        nixfmt.enable = true;
        prettierd.enable = true;
        isort.enable = true;
        black.enable = true;
      };
    };
  };
}
