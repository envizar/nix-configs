{ pkgs, inputs, ... }: 
let 
  hyprlandpkg = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
in {
  boot = {
    supportedFilesystems = [ "ntfs" ];
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.kernelModules = [ "amdgpu" ];
    loader = {
    	systemd-boot.enable = true;
    	efi.canTouchEfiVariables = true;
    };
  };

  # Mount disks
  fileSystems = {
    # 1 TB HDD
    "/mnt/hdd" = {
      device = "/dev/disk/by-uuid/ecbe9b51-e184-42ba-babe-33692373c6bb";
      fsType = "ext4";
      options = [ "nofail" ];
    };

    # SSD with Windows
    "/mnt/win" = {
      device = "/dev/disk/by-uuid/F4806AFF806AC826";
      fsType = "ntfs";
      options = [ "nofail" ];
    };
  };
  
  swapDevices = [
    # 8 GiB swap 🐟🐟🐟
    {
      device = "/var/lib/swapfile";
      size = 8*1024;
    }
  ];
}
