{ ... }: {
  # Disable because it conflicts with Hyprland home-manager module
  wayland.windowManager.hyprland.systemd.enable = false;
}