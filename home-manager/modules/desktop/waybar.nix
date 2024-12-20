{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {

        layer = "top";
        position = "top";
        spacing = 0;
        height = 51;

        modules-left = [ "image" "hyprland/workspaces" ];
        "image" = {
          path = "/home/envizar/nix/assets/nixos-logo.png";
          size = 38;
        };
        "hyprland/workspaces" = {
          on-click = "activate";
          # format = "{id}";
          format = "{name}{windows}";
          format-window-separator = "";
          window-rewrite-default = "";
          window-rewrite = {
          	"class<firefox>" = "  ";
          	"class<vesktop>" = "  ";
          	"class<jetbrains-idea> " = "  ";
          	"class<jetbrains-idea> title<win.*>" = "";
          	"class<obsidian>" = " 󰚸 ";
          	"class<brave-browser>" = "  ";
          	"class<alacritty>" = "  ";
          	"title<.*VSCodium>" = "  ";
          	"title<Minecraft.*>" = "  ";
          	"class<org.telegram.desktop>" = "  ";
          };
          persistent_workspaces = { 
            "*" = 1;
            # "2" = [];
            # "3" = [];
          };
        };

        modules-center = [ "hyprland/window" ];
        "hyprland/window" = {
          max-length = 80;
        };

        modules-right = [ "tray" "memory" "cpu" "pulseaudio" 
          "network" "hyprland/language" "clock" ];
        "tray" = {
          spacing = 10;
          icon-size = 16;
        };
        "memory" = {
          format = "  {used:0.1f}/{total:0.1f} GiB";
          interval = 5;
          max-length = 30;
        };
        "cpu" = {
          format = "  {load}%";
          interval = 2;
        };
        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-bluetooth = "󰂰 ";
          tooltip-format = "Volume : {volume}%";
          format-muted = " ";
          format-icons = {
            headphone = " ";
            default = [ " " " " " " ];
          };
          nospacing = 1;
          # Mute audio on click
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          scroll-step = 5;
        };
        "network" = {
          format-wifi = "{icon}";
          format-icons = [ "󰤯 " "󰤟 " "󰤢 " "󰤥 " "󰤨 " ];
          format-ethernet = " ";
          format-disconnected = "  ";
          tooltip-format-ethernet = ''{ifname}
          ⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}'';
          tooltip-format-disconnected = "Disconnected";
          interval = 5;
          nospacing = 1;
        };
        "hyprland/language" = {
          format = "  {short}";
        };
        "clock" = {
          format = "  {:%H:%M · %d.%m.%Y}";
          tooltip-format = "{calendar}";
        };
      };
    };

    style = ''

* {
  border: none;
  border-radius: 0;
  min-height: 0;
  font-family: JetBrains Mono;
  font-size: 16px;
  font-weight: 500;
}

window#waybar {
  background-color: #181825;
  transition-property: background-color;
  transition-duration: 0.5s;
}

window#waybar > * {
	padding-right: 5px;
	padding-left: 5px;
}

window#waybar.hidden {
  opacity: 0.5;
}

#workspaces {
  background-color: transparent;
}

#workspaces button {
  all: initial;
  /* Remove GTK theme values (waybar #1351) */
  min-width: 0;
  /* Fix weird spacing in materia (waybar #450) */
  box-shadow: inset 0px 0px transparent;
  /* Use box-shadow instead of border so the text isn't offset */
  padding: 6px 18px;
  margin: 6px 3px;
  border-radius: 6px;
  background-color: rgba(234, 229, 255, .05);
  color: rgb(234, 229, 255);
}

#workspaces button > * > * {
	font-size: 20px;
}

#workspaces button.active {
  color: #e7edff;
  background-color: #373470;
}

#workspaces button:hover {
  background-color: rgba(200, 210, 255, .15);
  color: rgb(255, 255, 255);
}

#workspaces button.urgent {
  color: #e7edff;
  background-color: #274db8;
}

#memory,
#custom-power,
#battery,
#backlight,
#pulseaudio,
#network,
#clock,
#tray,
#cpu,
#language {
  border-radius: 6px;
  margin: 6px 3px;
  padding: 6px 12px;
  background-color: #1e1e2e;
  color: #181825;
}

#custom-logo {
  padding-right: 7px;
  padding-left: 7px;
  margin-left: 5px;
  font-size: 15px;
  border-radius: 8px 0px 0px 8px;
  color: #1793d1;
}

#memory {
  color: rgb(252, 174, 76);
  background-color: rgba(252, 174, 76, .15);
}

#cpu {
	color: rgb(110, 185, 255);
	background-color: rgba(110, 185, 255, .15);
}

#language {
	color: rgb(150, 255, 77);
	background-color: rgba(150, 255, 77, .15);
}

@keyframes blink {
  to {
    background-color: #f38ba8;
    color: #181825;
  }
}

#battery.warning,
#battery.critical,
#battery.urgent {
  background-color: #ff0048;
  color: #181825;
  animation-name: blink;
  animation-duration: 0.5s;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}

#battery.charging {
  background-color: #a6e3a1;
}

#backlight {
  background-color: #fab387;
}

#pulseaudio {
  color: rgb(249, 226, 175);
  background-color: rgba(249, 226, 175, .15);
}

#pulseaudio.muted {
  color: rgb(255, 82, 61);
  background-color: rgba(255, 82, 61, .15);
}

#network {
  color: rgb(117, 254, 227);
  background-color: rgba(117, 254, 227, .15);
  /* padding-right: 17px; */
}

#network.disconnected {
	color: rgb(255, 78, 54);
	background-color: rgba(255, 78, 54, .15);
}

#clock {
  color: rgb(201, 184, 255);
  background-color: rgba(201, 184, 255, .15);
}

#custom-power {
  background-color: #f2cdcd;
}


tooltip {
  border-radius: 8px;
  padding: 15px;
  background-color: #131822;
}

tooltip label {
  padding: 5px;
  background-color: #131822;
}

#image {
	margin-right: 10px;
	margin-left: 10px;
}

      '';
  };
}
