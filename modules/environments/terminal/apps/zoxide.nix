{
  flake.modules = {
    homeManager.terminal = {
      programs = {
        zoxide = {
          enable = true;
          enableZshIntegration = true;
        };
      };
    };
  };
}