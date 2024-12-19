{ pkgs, ... }: {
  users = {
    users.envizar = {
      isNormalUser = true;
      description = "envizar";
      extraGroups = [ "networkmanager" "wheel" "input" "openrazer" "docker" ];
      packages = with pkgs; [];
    };
  };

  services.getty.autologinUser = "envizar";
}
