# Kitty - performant GPU-accelerated terminal
{ pkgs, ... }:


{
  home.packages = with pkgs; [
    maple-mono.NF
  ];

  programs.kitty = {
    enable = true;
    environment = {
      TERM = "xterm-256color";
    };
    font = {
      name = "Maple Mono NF";
      size = 12;
    };
    shellIntegration.enableFishIntegration = true;
    settings = {
      shell = "zellij";
      copy_on_select = "clipboard";
    };
    themeFile = "Catppuccin-Mocha";
  };
}
