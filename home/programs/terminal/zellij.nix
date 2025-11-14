# Zellij - terminal workspace with batteries included
{ pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    settings = {
      default_mode = "locked";
      theme = "Dracula";
      show_startup_tips = false;
    };
  };
}
