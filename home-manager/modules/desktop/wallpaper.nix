{ ... }: {
  services.hyprpaper = let
    wallpaper = "/home/envizar/nix/assets/nix-wallpaper-gear.png";
  in {
    enable = true;
    settings = {
      preload = [ "${wallpaper}" ];
      wallpaper = [ ",${wallpaper}" ];
    };
  };
}
