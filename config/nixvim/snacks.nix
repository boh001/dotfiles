{
  programs.nixvim = {
    enable = true;

    plugins = {
      snacks = {
        enable = true;

        settings = {
          dashboard = {
            width = 60;
            row = null;
            col = null;
            pane_gap = 4;
            autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

            preset = {
              pick = null;
              header = ''
                ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
                ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
                ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
                ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
                ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
                ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
              '';
            };

            sections = [
              { section = "header"; }
            ];
          };
        };
      };
    };
  };
}

