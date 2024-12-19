op=$( echo -e " Выключить ПК\n Перезагрузка\n Спящий режим" | wofi -i --dmenu --width 300 --height 200 --hide-scroll --prompt Поиск | awk '{print tolower($2)}' )

# case $op in 
#         poweroff)
#                 ;&
#         reboot)
#                 ;&
#         suspend)
#                 systemctl $op
#                 ;;
#         lock)
# 		swaylock
#                 ;;
#         logout)
#                 swaymsg exit
#                 ;;
# esac
case $op in
  выключить)
    systemctl poweroff
    ;;
    
  перезагрузка)
    systemctl reboot
    ;;

  спящий)
    systemctl suspend
    ;;
    
esac
