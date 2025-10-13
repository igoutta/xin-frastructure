{
  inputs, 
  ...
}:
{
  flake.modules = {
    homeManager.terminal = {
      programs = {
        eza = {
          enable = true;
          enableIonIntegration = false; #TODO: ION shell
          enableZshIntegration = true;
          colors = "always";
          git = true;
          icons = "auto";
          theme = (builtins.readFile "${inputs.eza-themes}/themes/rose-pine-moon.yml"); #TODO: CRASH
        };
      };
    };
  };
}