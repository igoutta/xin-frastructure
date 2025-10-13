{
  flake.modules = {
    homeManager.terminal = {
      programs = {
        fzf = {
          enable = true;
          enableZshIntegration = true;
        };
      };
    };
  };
}