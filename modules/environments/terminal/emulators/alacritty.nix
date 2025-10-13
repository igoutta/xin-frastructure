# alacritty - a cross-platform, GPU-accelerated terminal emulator
{
  flake.modules = {
    homeManager.terminal = {
      programs.alacritty = {
        enable = true;
        theme = "tokyo_night_enhanced";

        settings = {
          env.TERM = "xterm-256color";
          window = {
            opacity = 0.7;
            blur = true;
          };
          scrolling.multiplier = 5;
          font.size = 12;
          colors.draw_bold_text_with_bright_colors = true;
          selection.save_to_clipboard = true;
          cursor.style.shape = "Beam"; 
          mouse.hide_when_typing = true;
          mouse.bindings = [
            {
              mouse = "Middle";
              mods = "Control";
              action  = "Paste";
            }
          ];
        };
      };
    };
  };
}