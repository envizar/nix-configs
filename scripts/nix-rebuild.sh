if sudo nixos-rebuild switch --flake ~/nix ; then
  notify-send "Сборка NixOS прошла успешно" --expire-time=3000
else
  notify-send "Сборка NixOS завершилась с ошибками" --expire-time=3000 && sleep infinity
fi
