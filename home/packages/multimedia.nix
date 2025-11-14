# Multimedia applications and tools
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ani-cli
    calibre
    cava
    discord
    easyeffects
    ffmpeg
    gpu-screen-recorder-gtk
    librewolf
    mpv
    obsidian
    planify
    qbittorrent
    spotify
    vlc
  ];
}
