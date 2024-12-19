{ ... }: {
  services.hypridle = {
  	enable = true;
  	settings = {
  	  listener = [
        {
          # Lock after 15 minutes
          timeout = 60 * 15;
          on-timeout = "sh ~/scripts/hyprlock.sh";
        }
        {
          # Sleep after 20 minutes
          timeout = 60 * 20;
          on-timeout = "systemctl suspend";
        }
  	  ];
  	};
  };
}
