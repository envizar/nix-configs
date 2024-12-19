{ inputs, config, pkgs, ...}: {
  
  imports = [
    ./hardware-configuration.nix # Include hardware scan
    ./packages.nix # Installed software & fonts
    ./modules/export.nix # Include files from ./modules
  ];

  time.timeZone = "Europe/Moscow";
  i18n = {
  	defaultLocale = "ru_RU.UTF-8";
  	extraLocaleSettings = {
  	  LC_ADDRESS = "ru_RU.UTF-8";
      LC_IDENTIFICATION = "ru_RU.UTF-8";
  	  LC_MEASUREMENT = "ru_RU.UTF-8";
  	  LC_MONETARY = "ru_RU.UTF-8";
  	  LC_NAME = "ru_RU.UTF-8";
  	  LC_NUMERIC = "ru_RU.UTF-8";
  	  LC_PAPER = "ru_RU.UTF-8";
  	  LC_TELEPHONE = "ru_RU.UTF-8";
      LC_TIME = "ru_RU.UTF-8";
  	};
  };
  
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      allowed-users = [ "envizar" ];
      auto-optimise-store = true;
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
  	# Garbage collector & optimiser
  	gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    optimise = {
      automatic = true;	
      dates = [ "03:45" ];
    };
  };

  # DO NOT CHANGE!
  system.stateVersion = "24.05";
}
