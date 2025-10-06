{
  flake.modules = {
    nixos.core = 
      { pkgs, ...}:
      {
      services.pcscd.enable = true; #TODO: GPG
      programs.gnupg.agent = {
        enable = true;
        pinentryPackage = "matching the configured desktop environment or `pkgs.pinentry-curses`";
        enableSSHSupport = true;
      };
    };

    homeManager.core = {
      services.yubikey-agent = {
        enable = true;
      };
    };
  };
}
