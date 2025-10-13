#.override { enableWlrSupport = true; } # Amazing screenshot tool
{
  lib,
  ...
}:
{
  flake.modules = {
    nixos.gui = {
      systemd.user.services.flameshot = {
        environment = {
          QT_QPA_PLATFORM = "xcb";
        };
        serviceConfig = {
          ExecStart = "QT_QPA_PLATFORM=xcb flameshot";
        };
      };
    };

    homeManager.gui = 
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