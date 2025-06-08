# Cloud service tools & utilities
{ pkgs, lobster, ... }:

{
  home.packages = with pkgs; [
    # -----------------------------------------------------------
    # Cloud tools
    # -----------------------------------------------------------
    rclone # Sync files with cloud storage, command: rclone
    yt-dlp # Video downloader, command: yt-dlp

    # -----------------------------------------------------------
    # Flakes
    # -----------------------------------------------------------
    lobster.packages.${pkgs.system}.default # Movie / TV Show downloader, command: lobster
  ];
}
