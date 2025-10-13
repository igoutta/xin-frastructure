{
  flake.modules = {
    homeManager.terminal = {
      programs = {
        ripgrep = {
          enable = true;
          arguments = [
            "--smart-case"
            "--hidden"
            "--max-columns=150"
            "--max-columns-preview"
            "--colors=line:style:bold"
          ];
        };
      };
    };
  };
}