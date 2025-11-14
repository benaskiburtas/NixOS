# Multimedia applications and tools
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ani-cli # Browse and play anime, command: ani-cli
    calibre # E-Book management software (GUI)
    cava # Audio visualizer, command: cava
    discord # Chat client (GUI)
    easyeffects # Audio effects for PipeWire (GUI)
    ffmpeg # Media processing, commands: ffmpeg/ffprobe
    gpu-screen-recorder-gtk # GTK frontend for gpu-screen-recorder (GUI)
    librewolf # Privacy-focused Firefox fork (GUI)
    mpv # Media player, command: mpv
    obsidian # Note-taking (GUI)
    planify # Task manager with Todoist support (GUI)
    qbittorrent # Bittorrent client (GUI)
    spotify # Music streaming (GUI)
    vlc # Media player (GUI)
  ];
}
