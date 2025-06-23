# Kitty - performant GPU-accelerated terminal
{ pkgs, ... }:


{
  programs.kitty = {
    enable = true;
    environment = {
      TERM = "xterm-256color";
    };
    shellIntegration.enableFishIntegration = true;
    settings = {
      shell = "zellij";
      scrollback_lines = 10000;
      copy_on_select = "clipboard";
    };
  };
}
