# Gaming-related packages and tools
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    archipelago
    ferium
    mangohud
    protonplus
    protontricks
    r2modman
    samrewritten
    winetricks
    wineWow64Packages.staging
  ];
}
