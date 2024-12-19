{ inputs, pkgs, ... }: {

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    
    settings = {

      monitor = "DP-1,2560x1080@144,0x0,1";
      
      # AUTOSTART
      exec-once = [
        "uwsm app -- hyprpaper"
        "uwsm app -- waybar"
        "uwsm app -- mako --config /home/envizar/.config/mako/config"
        "uwsm app -- systemctl --user start plasma-polkit-agent"
        "uwsm app -- wl-paste -t text --watch clipman store"
      ];

      # ENVIRONMENT VARIABLES
      env = [
        "ELECTRON_OZONE_PLATFORM_HINT,1"
        "XDG_SESSION_TYPE,wayland"
        "CLUTTER_BACKEND,wayland"
        "SDL_VIDEODRIVER,wayland"
        "QT_QPA_PLATFORM,wayland;xcb"
        "GDK_BACKEND,wayland,x11,*"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "MOZ_ENABLE_WAYLAND,1"
      ];

      # LOOK AND FEEL
      general = {
        gaps_in = 6;
        gaps_out = 12;

        border_size = 3;

        "col.active_border" = "rgba(d4e1faee) rgba(edd4faee) 30deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";

        allow_tearing = true;
      };

      cursor = {
      	no_warps = true;
      	allow_dumb_copy = true;
      };

      decoration = {
        rounding = 10;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow.enabled = false;

        blur = {
            enabled = false;
            size = 3;
            passes = 1;

            vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
         "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        preserve_split = true;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
	    animate_manual_resizes = false;
        animate_mouse_windowdragging = true;
	    font_family = "JetBrainsMono Nerd Font";
	    middle_click_paste = false;
        enable_swallow = true;
        render_ahead_of_time = false;
      };

      # INPUT
      device = [
        {
          name = "logitech-g102-prodigy-gaming-mouse";
          sensitivity = 0;
          scroll_button_lock = true;
        }
        {
          name = "razer-razer-ornata-chroma";
	        kb_layout = "us,ru";
        }
      ];
      
    };
  };

  
  
}
