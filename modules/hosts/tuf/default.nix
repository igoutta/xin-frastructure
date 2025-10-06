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
      facter
      audio
      bluetooth
      printing
      ubication
      ssh
      vpn
      virtualisation
      development
      environments.graphical
      environments.runtime
      environments.terminal

      # Users
      root
      ga
    ]
    # Specific Home-Manager modules
    ++ [
      {
        home-manager.users.ga.imports = with config.flake.modules.homeManager; [
          core
          facter
          development
          environments.graphical
          environments.runtime
          environments.terminal
          onedrive
        ];
      }
    ];
}
