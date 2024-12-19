{ pkgs, ... }: {
  environment = {
    # Fix electron apps
  	sessionVariables.NIXOS_OZONE_WL = "1";
  	variables = {
  	  EDITOR = "micro";
  	  MOZ_ENABLE_WAYLAND = "1";
  	  MICRO_TRUECOLOR = "1";

      # This shot breaks something so it's disabled
  	  # LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [ pkgs.udev pkgs.stdenv.cc.cc.lib pkgs.glibc ];
  	};
  };
}
