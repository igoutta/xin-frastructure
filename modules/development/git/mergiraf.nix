{
  flake.modules = {
    homeManager.development = {
      programs.mergiraf = {
        enable = true;
      };
    };
  };
}
