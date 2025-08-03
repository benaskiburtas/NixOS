# Cloud service tools & utilities
{ pkgs, ... }:

{

  home.packages = with pkgs; [
    rclone # Sync files with cloud storage, command: rclone
    yt-dlp # Video downloader, command: yt-dlp
  ];
}
