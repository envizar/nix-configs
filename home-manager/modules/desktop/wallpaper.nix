{ ... }: {
  services.hyprpaper = let
    wallpaper = "/home/envizar/.config/imgs/nix-wallpaper-gear.png";
  in {
    enable = true;
    settings = {
      preload = [ "${wallpaper}" ];
      wallpaper = [ ",${wallpaper}" ];
    };
  };
}
