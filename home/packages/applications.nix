# Multimedia applications and tools
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ani-cli
    cava
    easyeffects
    ffmpeg
    gpu-screen-recorder-gtk
    mpv
    planify
    vlc
  ];
}
