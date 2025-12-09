# Gaming-related packages and tools
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    archipelago
    bottles
    ferium
    heroic
    mangohud
    prismlauncher
    protonplus
    protontricks
    r2modman
    samrewritten
    winetricks
    wineWowPackages.staging
  ];
}
