{
  flake.modules.nixos.root =
    { pkgs, ... }:
    {
      users.mutableUsers = false;
      
      users.users.root = {
        shell = pkgs.zsh;
        initialPassword = "123456";
      };
    };
}
