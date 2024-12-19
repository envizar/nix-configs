{ ... }: {
  wayland.windowManager.hyprland.settings = {

	# ALIASES
    "$terminal" = "alacritty";
    "$fileManager" = "thunar";
    "$menu" = "wofi --show drun --width 500 --height 600 --hide-scroll --no-actions --allow-images --prompt Поиск --term alacritty";
    "$discord" = "vesktop --proxy-server=127.0.0.1:12334";
    "$browser" = "firefox";
    "$telegram" = "telegram-desktop";
    "$cliphistory" = "clipman pick -t wofi -T'--height 400 --width 700 -e -I'";
    "$powermenu" = "sh ~/nix/scripts/powermenu.sh";
    "$terminote" = "alacritty --class terminote -e micro -config-dir /home/envizar/.config/micro/notes/";
    "$minecraft" = "ModrinthApp";
    "$vpn" = "hiddify";
    "$rebuild" = "alacritty --class nixrebuild -e sh ~/nix/scripts/nix-rebuild.sh";
    "$lock" = "sh ~/nix/scripts/hyprlock.sh";
    "$switchlang" = "sh ~/nix/scripts/switchlang.sh";

    binds.allow_workspace_cycles = true;

    "$mainMod" = "SUPER";

    bind = [
      # Program binds
      "$mainMod, Q, exec, $terminal" # Win + Q => Alacritty
      "$mainMod, D, exec, $discord" # Win + D => Discord
      "$mainMod, B, exec, $browser" # Win + B => Browser
      "$mainMod, T, exec, $telegram" # Win + T => Telegram
      "$mainMod, O, exec, $telegram" # Win + O => Obsidian
      "$mainMod, M, exec, $minecraft" # Win + M => Minecraft launcher
      "$mainMod, E, exec, $fileManager" # Win + E => File explorer
      "$mainMod, N, exec, $terminote" # Win + N => Terminote
      "$mainMod, H, exec, $vpn" # Win + H => VPN client
      "$mainMod SHIFT, S, exec, $rebuild" # Win + Shift + S => System rebuild window
              
      # Menus
      "$mainMod, R, exec, $menu" # Win + R => Open run menu
      "$mainMod CTRL, V, exec, $cliphistory" # Win + CTRL + V => Clipboard history
      "$mainMod SHIFT, ESCAPE, exec, $powermenu" # Win + Shift + Esc => Power menu
        
      # Windows
      "$mainMod, C, killactive," # Win + C => Close window
      "$mainMod, V, togglefloating," # Win + V => Floating window mode
      "$mainMod, P, pin" # Win + P => Pin floating window
      "$mainMod, F, fullscreen" # Win + F => Fullscreen mode
      "$mainMod, J, togglesplit, # dwindle" # Win + J => Toggle dwindle split
      # Change window focus
      "$mainMod, left, movefocus, l" 
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      # Other
      "$mainMod, ESCAPE, exec, $lock" # Win + Esc => Sleep
      "$mainMod, SPACE, exec, $switchlang" # Win + Space => Switch lang
      '', Print, exec, grimblast --freeze save area - | swappy -f -'' # Screenshot
      ''SHIFT, Print, exec, hyprpicker -a'' # Color picker
      # Change volume by Win + "+" or Win + "-"
      "$mainMod, EQUAL, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      "$mainMod, MINUS, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

      # Workspace binds
      "$mainMod, GRAVE, workspace, previo"
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod, S, movetoworkspace, +0"
      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod, S, movetoworkspace, special:magic"
      "$mainMod, S, togglespecialworkspace, magic"
    ];

    bindm = [
      # Move and resize windows
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    # WINDOWS AND WORKSPACES
    windowrulev2 = [
      # Browser
      "float, title:(Картинка в картинке)"
      "float, title:(Просмотр медиа)"
      "float, title:(Картинка в картинке)"

      # Terminote
      "float, class:(terminote)"
      "pin, class:(terminote)"
      "size 676 493, class:(terminote)"
      "move cursor -50% -50%, class:(terminote)"

      # Rebuild window
      "float, class:(nixrebuild)"
      "move 1745 66, class:(nixrebuild)"

      # Telegram
      "float, class:(org.telegram.desktop)"
      "size 1000 1000, class:(org.telegram.desktop)"
      "move 1550 60, class:(org.telegram.desktop)"

      # Other programs
      "float, class:(nekoray)"
      "float, class:(Thunar)"
      "float, class:(thunar)"

      # Do not change
      "suppressevent maximize, class:.*"
      "float, class:(floating)"
    ];

  };
}
