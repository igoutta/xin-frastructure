{
  flake.modules = {
    homeManager.environments.terminal = {
      programs = {
        direnv = {
          enable = true;
          enableZshIntegration = true;
          config = {
            global = {
              hide_env_diff = true;
            };
          };
          nix-direnv.enable = true;
        };
      };
    };
  };
}