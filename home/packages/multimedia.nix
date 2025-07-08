# Multimedia applications and tools
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cava # Audio visualizer, command: cava
    discord # Chat client (GUI)
    easyeffects # Audio effects for PipeWire (GUI)
    ffmpeg # Media processing, commands: ffmpeg/ffprobe
    kdePackages.kdenlive # Video Editor (GUI)
    kdePackages.kalk # KDE Calculator (GUI)
    krita # Digital painting (GUI)
    librewolf # Privacy-focused Firefox fork (GUI)
    mpv # Media player, command: mpv
    obsidian # Note-taking (GUI)
    qbittorrent # Bittorrent client (GUI)
    rofi # Application launcher (GUI)
    spotify # Music streaming (GUI)
    vlc # Media player (GUI)
    wiki-tui # Wikipedia TUI client, command: wiki-tui
  ];
}
