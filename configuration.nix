# Main system configuration - universal settings only
{ config, pkgs, ... }:

{
  system.stateVersion = "25.11";

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment = {
    systemPackages = with pkgs; [
      git
      vim
      wget
      gparted
    ];
    variables.EDITOR = "vim";
  };
}
