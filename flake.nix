###################################################################################################
# flake.nix --- the heart of my dotfiles
#
# Author:  Gustavo Alvarado <igoutta@protonmail.com>
# URL:     https://github.com/igoutta/nix-frastructure
# License: MIT
#
# Ground zero. Where the whole flake gets set up and all its modules are loaded.
###################################################################################################

{
  description = "GA NixOS configuration.";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    # Core dependecies
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-edge.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware/ba6fab29768007e9f2657014a6e134637100c57d";
    
    # Secrets and authentification for repositories
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    nix-auth.url = "github:numtide/nix-auth";

    # Desktop environment
    plasma-manager.url = "github:nix-community/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Extras
    catppuccin-bat.url = "github:catppuccin/bat";
    catppuccin-bat.flake = false;

    eza-themes.url = "github:eza-community/eza-themes";
    eza-themes.flake = false;

    # Apps
    ghostty.url = "github:ghostty-org/ghostty";

    helix.url = "github:helix-editor/helix";

    blender-bin.url = "github:edolstra/nix-warez?dir=blender";
    blender-bin.inputs.nixpkgs.follows = "nixpkgs-edge";

    # Nixos User Repository
    nur.url = "github:nix-community/NUR";

    nix-webapps.url = "github:TLATER/nix-webapps";

    nixpak.url = "github:nixpak/nixpak";
    nixpak.inputs.nixpkgs.follows = "nixpkgs";

    # Simplify System Configuration
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    pkgs-by-name-for-flake-parts.url = "github:drupol/pkgs-by-name-for-flake-parts";

    import-tree.url = "github:vic/import-tree";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";

    make-shell.url = "github:nicknovitski/make-shell";

    git-hooks.url = "github:cachix/git-hooks.nix";

    systems.url = "github:nix-systems/default";

    haumea.url = "github:nix-community/haumea/v0.2.2";
    haumea.inputs.nixpkgs.follows = "nixpkgs";

    deploy-rs.url = "github:serokell/deploy-rs";

    # System Generators
    nixos-generators.url = "github:nix-community/nixos-generators";
    nixos-generators.inputs.nixpkgs.follows = "nixpkgs";
    
    nixos-facter-modules.url = "github:numtide/nixos-facter-modules";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}


