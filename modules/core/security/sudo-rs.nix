{
  flake.modules.nixos.core = {
    security.sudo-rs.enable = true;
    security.sudo-rs.wheelNeedsPassword = false; # Use 'sudo' without a password
  };
}
