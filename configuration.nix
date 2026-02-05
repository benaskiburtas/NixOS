# Main system configuration - universal settings only
{ config, pkgs, ... }:

{
  system.stateVersion = "25.11";

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.neovim.defaultEditor = true;

  environment = {
    systemPackages = with pkgs; [
      git
      wget
      gparted
    ];
  };
}
