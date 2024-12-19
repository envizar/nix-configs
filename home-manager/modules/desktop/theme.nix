{ pkgs, ... }: let

  cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Classic";
    size = 22;
  };

in {
  gtk = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.nerd-fonts.jetbrains-mono;
      size = 12;
    };
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
    	name = "Colloid-teal-dark";
    	package = pkgs.colloid-icon-theme;
    };
  };
  dconf.settings = {
  	"org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        # gtk-theme = "Adwaita:dark";
  	};
  };

  home = with cursor; {
    pointerCursor = {
      inherit package name size;
      gtk.enable = true;
      x11 = {
        enable = true;
        defaultCursor = true;
      };
    };
    sessionVariables = {
      XCURSOR_THEME = name;
      XCURSOR_SIZE = size;
    };
  };
  wayland.windowManager.hyprland.settings = {
    cursor = {
      enable_hyprcursor = true;
      no_hardware_cursors = false;
    };
    exec-once = [ "hyprctl setcursor ${cursor.name} ${toString cursor.size}" ];
  };
}
