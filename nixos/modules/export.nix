{
  imports = [
    ./boot.nix # Boot options, mount devices, swap
    ./env.nix # Environment variables
    ./network.nix # Network config, iptables rules
    ./sound.nix # Sound server setup
    ./users.nix # Users, autologin
    ./virtualization.nix # Things connected to virtualization
    ./mesa.nix # https://wiki.hyprland.org/Nix/Hyprland-on-NixOS/
    ./mysql.nix # MariaDB config
    ./hyprland.nix
    # ./openrazer.nix
  ];
}
