{
  flake.modules = {
    homeManager.core = 
    { pkgs, ... }:
    {
      programs = {
        micro = {
          enable = true;
          package = pkgs.micro-with-wl-clipboard; #I use WAYLAND
          settings = {
            diffgutter = true;
            hlsearch = true;
            keymenu = true;
            mkparents = true;
            savecursor = true;
            saveundo = true;
            scrollbar = true;
            softwrap = true;
            wordwrap = true;
            tabsize = 2;
            tabstospaces = true;
            truecolor = "on";
          };
        };
      };

      home.sessionVariables = {
        EDITOR = "micro";
        VISUAL = "micro";
      };
    };
  };
}
