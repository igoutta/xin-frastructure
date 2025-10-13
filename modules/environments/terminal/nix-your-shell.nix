{
  flake.modules = {
    homeManager.terminal = {
      programs = {
        nix-your-shell = {
          enable = true;
          enableZshIntegration = true;
        };
      };
    };
  };
}