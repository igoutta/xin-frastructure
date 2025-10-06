{
  flake.modules = {
    homeManager.environments.terminal = {
      programs = {
        # Yet another cross-platform graphical process/system monitor.
        bottom = {
          enable = true;
          settings = {
            flags = {
              average_cpu_row = true;
              temperature_type = "c";
              regex = true;
            };
            styles.battery.low_battery_color = "red";
          };
        };
      };
    };
  };
}
