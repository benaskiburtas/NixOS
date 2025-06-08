# Home-manager entry point
{
  config,
  pkgs,
  lobster,
  ...
}:

{
  imports = [
    # Package categories
    ./packages/archives.nix
    ./packages/cli.nix
    ./packages/cloud.nix
    ./packages/development
    ./packages/gaming.nix
    ./packages/monitoring.nix
    ./packages/multimedia.nix
    ./packages/networking.nix
    ./packages/security.nix

    # Program configurations
    ./programs/git.nix
    ./programs/ncspot.nix
    ./programs/terminal
  ];

  # Basic home configuration
  home.username = "peach";
  home.homeDirectory = "/home/peach";

  # State version and configuration
  home.stateVersion = "24.11";
  home.enableNixpkgsReleaseCheck = false;
  programs.home-manager.enable = true;
}
