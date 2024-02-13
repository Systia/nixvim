{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        clangd.enable = true;
        rust-analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
        lua-ls.enable = true;
        nil_ls.enable = true;
        nixd.enable = false;
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
