topLevel: {
  flake.modules = {
    homeManager.core =
      { config, ... }:
      {
        programs = {
          gpg = {
            enable = true;
            # settings = { #TODO
            #   default-key = topLevel.config.flake.meta.users.${config.home.username}.key;
            # };
          };
        };

        services = {
          gpg-agent = {
            enable = true;
            enableSshSupport = true;
            # sshKeys = topLevel.config.flake.meta.users.${config.home.username}.keygrip; #TODO
          };
        };
      };
  };
}
