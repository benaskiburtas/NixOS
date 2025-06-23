# Open Broadcaster Software
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    obs-studio
  ];

  # Include bundled configs
  xdg.configFile."obs-studio" = {
    source = ./config;
    recursive = true;
  };
}