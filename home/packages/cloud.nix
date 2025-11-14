# Cloud service tools & utilities
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rclone
    yt-dlp
  ];
}
