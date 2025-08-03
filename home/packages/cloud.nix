# Cloud service tools & utilities
{ pkgs, lobster, ... }:

{

  home.packages = with pkgs; [
    rclone # Sync files with cloud storage, command: rclone
    yt-dlp # Video downloader, command: yt-dlp

    # Flakes
    ## Requires the 'github:justchokingaround/lobster' flake
    lobster.packages.${pkgs.system}.default # Movie / TV Show downloader, command: lobster
  ];
}
