{
  description = "GA NixOS configuration";

  inputs = {
	  nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	  nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
	  chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #helix.url = "github:helix-editor/helix";
    nixos-hardware.url = "github:NixOS/nixos-hardware/ba6fab29768007e9f2657014a6e134637100c57d";
  };

  outputs = inputs@{
    self,
    nixpkgs,
    nixpkgs-stable,
    chaotic,
    nixos-hardware,
    home-manager, ... }: {
    # Please replace my-nixos with your hostname
    nixosConfigurations = {
      ga = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
	      specialArgs = {
	        pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = [
          # Import the previous configuration.nix we used,
          # so the old configuration file still takes effect
          ./configuration.nix
          #nixos-hardware.nixosModules.asus-fx506hm
          chaotic.nixosModules.default
          #./hosts/asus-tuf
          ./modules
          ./modules/virtualization
          # make home-manager as a module of nixos
          # so that home-manager configuration will be 
          # deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.ga = import ./home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }
        ];
      };
    };
  };
}
