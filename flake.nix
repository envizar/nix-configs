{
  description = "Main NixOS flake";

  inputs = {
  
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # for grimblast
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... } @ inputs: 
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
      	inherit system;
      	specialArgs = {
      	  pkgs-stable = import nixpkgs-stable {
      	    inherit system;
      	    config.allowUnfree = true;
      	  };
      	  inherit inputs system; 
      	};

        modules = [
          ./nixos/configuration.nix
      	  home-manager.nixosModules.home-manager 
      	  {
      		  home-manager.useGlobalPkgs = true;
      		  home-manager.useUserPackages = true;
      		  home-manager.users.envizar = import ./home-manager/home.nix;
      	  }
      	];
      };
    };
  };
}
