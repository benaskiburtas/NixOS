# Gaming-related packages and tools
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ferium # Minecraft mod manager, command: ferium
    heroic # Epic Games/GOG launcher (GUI)
    lutris # Game platform (GUI)
    mangohud # Vulkan overlay for monitoring, command: mangohud
    prismlauncher # Minecraft launcher (GUI)
    protonplus # Proton version manager (GUI)
    protontricks # Proton/Steam helper, command: protontricks
    r2modman # Mod manager (GUI)
    wineWowPackages.staging
    winetricks # Wine helpers, command: winetricks
  ];
}
