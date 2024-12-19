{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        # grace = 300;
        disable_loading_bar = true;
        no_fade_in = true;
        ignore_empty_input = true;
      };

      background = [
      	{
      		path = "screenshot";
      		blur_passes = 3;
      		blur_size = 6;
      		brightness = 0.2;
      	}
      ];

      input-field = [
      	{
      	    outline_thickness = 0;
      		size = "200, 50";
      		position = "0, 0";
      		monitor = "";
      		dots_center = true;
      		fade_on_empty = false;
      		placeholder_text = "Введите пароль";
      		check_color = "rgb(80, 80, 80)";
      		fail_color = "rgb(180, 0, 0)";
      		fail_text = "";
      		fail_timeout = 500;
      		fail_transition = 300;
      	}
      ];
    };
  };
}
