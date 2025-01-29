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
    	name = "Adwaita";
    	package = pkgs.adwaita-icon-theme;
    };
    gtk4.extraCss = ''
      popover contents {
      	border-bottom-left-radius: 0;
      	border-bottom-right-radius: 0;
      	border-top-left-radius: 0;
      	border-top-right-radius: 0;
      	box-shadow: none;
      	margin-top: -12px;
      }  
      
      popover arrow {
      	background: transparent;
      	border-color: transparent;
      }
    '';
  };
  dconf.settings = {
  	"org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "Adwaita-dark";
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
