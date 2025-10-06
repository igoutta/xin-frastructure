{
  flake.modules = {
    nixos.core = {
      programs.command-not-found.enable = false;
    };

    homeManager.core = {
      programs.command-not-found.enable = false;
    };
  };
}
