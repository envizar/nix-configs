{
  programs.alacritty = {
    enable = true;

    settings = {
      window.opacity = 0.9;

      scrolling.multiplier = 5;
      selection.save_to_clipboard = false;

      terminal = {
      	shell = "fish";
      };

      font = {
        size = 16;
        # draw_bold_text_with_bright_colors = true;
        normal = {
          family = "JetBrainsMono Nerd Font";
        };
      };

      cursor = {
        style = "Beam";
        thickness = 0.15;
      };

      colors.primary.background = "#151726";
    };
  };
}
