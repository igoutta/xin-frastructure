{
  flake.modules =
    let
      stateVersion = "25.05";
    in
    {
      homeManager.core = {
        home = {
          inherit stateVersion;
        };
      };

      nixos.core = {
        system = {
          inherit stateVersion;
          # See https://github.com/NixOS/nixpkgs/pull/415640
          rebuild.enableNg = true;
        };
      };
    };
}
