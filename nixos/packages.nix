{ config, pkgs, inputs, system, pkgs-stable, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    # Hyprland
    hyprpaper
    hyprcursor
    hypridle
    hyprpicker # color picker
    xdg-desktop-portal-wlr
    hyprpolkitagent
      
    # Desktop environment
    xwayland # wayland support fox xorg apps
    clipse # clipboard history
    waybar
    wofi # app launcher
    pipewire wireplumber # sound
    xfce.thunar xfce.xfconf # file explorer
    glib glew # some important lib just don't touch
    wl-clipboard wl-clip-persist clipman
    mako libnotify # notifications
    grim grimblast slurp swappy # screenshots
    openrazer-daemon polychromatic # for razer keyboard
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    # polkit-kde-agent
    # wf-recorder # screen video recorder

    # Software
    alacritty # terminal
    firefox
    brave
    vesktop # discord client
    obsidian
    modrinth-app
    libreoffice
    vlc # media player
    telegram-desktop
    obs-studio
    blockbench
    motrix # torrent client
    nekoray
    pkgs-stable.sonic-visualiser
    iperf
    mongodb-compass
    hiddify-app
    vscodium # vscode
    jetbrains.webstorm
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    pomodoro-gtk
    superfile
    loupe # image viewer

    # Disabled since i don't use it
    # figma-linux 
    # zoom-us
    # inputs.ayugram-desktop.packages.${pkgs.system}.default

    # Terminal
    fastfetch # replacement for neofetch
    eza # replacement for ls
    micro # replacement for nano
    btop # replacement for htop
    docker
    udisks
    appimage-run
    iptables
    dig
    zip unzip
    rar unrar
    xdg-utils
    wget
    libwebp
    rsync
    mubeng # check for active proxies
    mtr # newtwork util
    jq # json parser command

    # Other
    adwaita-icon-theme
    amdvlk
    home-manager
    polkit

    # Dev
    nodejs_22 pnpm bun
    python3
    python312Packages.pip
    python312Packages.tkinter
    git gh
    zulu21 # java 21
    zulu17 # java 17
    zulu8 # java 8
    insomnia # for API testing
    mariadb
    gradle
    ktlint
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];
}
