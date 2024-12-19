if sudo nixos-rebuild switch --flake ~/nix ; then
  notify-send "Сборка NixOS прошла успешно" --expire-time=1500
else
  notify-send "Сборка NixOS завершилась с ошибками" --expire-time=1500 && sleep infinity
fi
