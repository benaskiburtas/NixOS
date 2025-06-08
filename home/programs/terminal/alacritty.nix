# Alacritty - performant GPU-accelerated terminal
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nerd-fonts.hurmit # Programming-friendly font
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      terminal.shell.program = "zellij";
      font = {
        normal.family = "Hurmit Nerd Font";
        size = 11;
      };
      window = {
        opacity = 0.9;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };
}
