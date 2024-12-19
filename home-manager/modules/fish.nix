let 
  flakeDir = "~/nix"; 
in {
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
      alias ls "eza --icons"
      alias ff "fastfetch"
      alias sswitch "sudo nixos-rebuild switch --flake ${flakeDir}"
      alias supdate "sudo nix flake update ${flakeDir}"
      alias supgrade "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}"
      alias mcinit "sh ~/scripts/mcinit.sh"
      alias editpkgs "micro ~/nix/nixos/packages.nix"
      alias countfish "sh ~/scripts/fishcount.sh"
      
      alias run-paper "java -jar paper-*.jar nogui"
      alias run-purpur "java -jar purpur-*.jar nogui"
      alias run-leaf "java -jar leaf-*.jar nogui"
    '';

    plugins = [];
  };
}
