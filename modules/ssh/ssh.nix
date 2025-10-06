{
  flake.modules.nixos.ssh = {
    services.openssh = {
      enable = true;
      startWhenNeeded = true;

      banner = ''
        ██████████████████████████████████████████████████████████████████████████
        █▌                                                                      ▐█
        █▌     ▄██████▄     ▄████████          ███     ███    █▄     ▄████████  ▐█
        █▌    ███    ███   ███    ███      ▀█████████▄ ███    ███   ███    ███  ▐█
        █▌    ███    █▀    ███    ███         ▀███▀▀██ ███    ███   ███    █▀   ▐█
        █▌   ▄███          ███    ███          ███   ▀ ███    ███  ▄███▄▄▄      ▐█
        █▌  ▀▀███ ████▄  ▀███████████          ███     ███    ███ ▀▀███▀▀▀      ▐█
        █▌    ███    ███   ███    ███          ███     ███    ███   ███         ▐█
        █▌    ███    ███   ███    ███          ███     ███    ███   ███         ▐█
        █▌    ████████▀    ███    █▀          ▄████▀   ████████▀    ███         ▐█
        █▌                                                                      ▐█
        ██████████████████████████████████████████████████████████████████████████
      '';

      allowSFTP = true;
      sftpServerExecutable = "internal-sftp";
      
      openFirewall = true;
      settings = {
        PasswordAuthentication = true;
        UseDns = true;
        X11Forwarding = false;
        PermitRootLogin = "no";
        PrintMotd = true;
      };
    };
  };
}