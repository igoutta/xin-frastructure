{
  flake.modules.homeManager.core = {
    xdg = {
      enable = true;
      mime.enable = true;
      userDirs = {
        enable = true;
        createDirectories = true;
        templates = null;
        music = null; #TODO: observe
        publicShare = null;
      };
      autostart = {
        enable = true;
      };
    };
  };
}
