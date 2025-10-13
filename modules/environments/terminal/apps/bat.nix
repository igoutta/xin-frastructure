{
  inputs, 
  ...
}:
{
  flake.modules = {
    homeManager.terminal = 
      { pkgs, ... }:
      {
      programs = {
        bat = {
          enable = true;
          
          settings = {
            italic-text = "always";
            map-syntax = [
              "*.ino:C++"
              ".ignore:Git Ignore"
            ];
            pager = "less -FR --mouse";
            paging = "never";
            theme = "${inputs.catppuccin-bat}/themes/Catppuccin Mocha.tmTheme"; #TODO: CRASH
          };

          extraPackages = with pkgs.bat-extras; [
            batman
            batdiff
            batgrep #Requires ripgrep
            prettybat
          ];
        };
      };
    };
  };
}