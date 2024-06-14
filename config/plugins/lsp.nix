{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        astro.enable = true;
        clangd.enable = true;
        rust-analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
        lua-ls.enable = true;
        nil_ls.enable = true;
        nixd.enable = false;
        html.enable = true;
        cssls.enable = true;
        tsserver.enable = true;
        pyright.enable = true;
      };
      keymaps = {
        lspBuf = {
          K = "hover";
          "<leadr>gr" = "references";
          "<leader>gd" = "definition";
          "<leader>gi" = "implementation";
          "<leader>gt" = "type_definition";
          "<leader>ca" = "code_action";
          "<leader>cf" = "format";
        };
      };
    };
    lsp-format.enable = true;
  };
}
