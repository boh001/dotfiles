{
  programs.nixvim = {
    plugins.luasnip.enable = true;
    plugins.blink-cmp = {
      enable = true;

      settings = {
        keymap = {
          preset = "default";
        };

        appearance = {
          nerd_font_variant = "mono";
        };

        completion = {
          documentation = {
            auto_show = true;
          };
        };

        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
          ];
        };

        snippets = {
          preset = "luasnip";
        };

        signature = {
          enabled = true;
        };
      };
    };
  };
}
