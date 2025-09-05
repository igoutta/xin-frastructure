{ config, pkgs-stable, ...}:

{
  environment.systemPackages = with pkgs-stable; [
	  nixfmt-rfc-style
	];
}
