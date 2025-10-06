{
  flake.modules.homeManager.development =
    { config, ... }:
    {
      xdg = {
        userDirs = {
          extraConfig = {
            XDG_CODE_DIR = "${config.home.homeDirectory}/Code";
          };
        };
      };
    };
}
