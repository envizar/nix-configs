{ config, ... }: {

  # I no longer use zsh, so it can be deleted
  # But I keep it here for some reason

  programs.zsh = {

    enable = false;
    enableCompletion = true;
    autosuggestion.enable = false;
    syntaxHighlighting.enable = true;
  
    shellAliases = let flakeDir = "~/nix"; in {
      ls = "eza --icons";
      ff = "fastfetch";

      switch = "sudo nixos-rebuild switch --flake ${flakeDir}";
      update = "sudo nix flake update ${flakeDir}";
      upgrade = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
    };

    history = {
      size = 5000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = false;
      plugins = [ "git" "sudo" ];
      theme = "agnoster";
    };

  };
}
