{
  flake.modules.nixos.ssh =
    { pkgs, ... }:
    {
    environment.systemPackages = with pkgs; [
      dotacat
      figlet
      toilet
    ];

    programs.rust-motd = {
      enable = true;
      enableMotdInSSHD = true;
      refreshInterval = "150s"; # "*/2.5 * * * *""

      settings = {
        global = {
          progress_full_character = "=";
          progress_empty_character = "-";
          progress_prefix = "[";
          progress_suffix = "]";
          time_format = "%Y/%m/%d %H:%M:%S %Z";
        };
        banner = {
          command = ''
            echo "> $(hostname)" | figlet -f fraktur | dotacat -S 816 &&
            date '+Hoy, %A %d de %B a las %T.'
          '';
        };
        weather = {
          loc = "Guayaquil,Ecuador";
          style = "day";
          timeout = 3;
        };
        filesystems = { 
          root = "/";
          home = "/home";
        };
        load-avg = { format = ''
          Carga (1, 5, 15 min.): {one:.02}, {five:.02}, {fifteen:.02}
          ''; 
        };
        memory = { swap_pos = "none"; }; # or "below" or "besides"
        uptime = { prefix = "Encendido hace "; };
      };

      order = [
        "banner"
        "weather"
        "filesystems"
        "load_avg"
        "memory"
        "uptime"
      ];
    };
  };
}