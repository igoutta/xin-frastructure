#.override { enableWlrSupport = true; } # Amazing screenshot tool
{
  lib,
  ...
}:
{
  flake.modules = {
    nixos."environments/runtimes" = {
      systemd.user.services.flameshot = {
        environment = {
          QT_QPA_PLATFORM ="xcb";
        };
      };
    };

    homeManager."environments/runtime" = 
    { config, ...}: 
    {
      services.flameshot = {
        enable = true;
        settings.General = {
          copyOnDoubleClick = true;
          savePath = "${config.home.homeDirectory}/Pictures/Screenshots";
          savePathFixed = true;
          autoCloseIdleDaemon = true;
          startupLaunch = false;
          saveAsFileExtension = ".png";
          showStartupLaunchMessage = false;
          saveLastRegion = true;
        };
      };
    };
  };
}