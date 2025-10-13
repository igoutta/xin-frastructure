{
  config,
  ...
}:
{
  flake.modules.nixos."hosts/tuf".imports =
    with config.flake.modules.nixos;
    [
      # Modules
      core
      hardware
      firmware
      audio
      bluetooth
      printing
      ubication
      ssh
      vpn
      virtualisation
      development
      gui
      terminal

      # Users
      root
      ga
    ]
    # Specific Home-Manager modules
    ++ [
      {
        home-manager.users.ga.imports = with config.flake.modules.homeManager; [
          core
          hardware
          development
          gui
          terminal
          cloud
        ];
      }
    ];
}
