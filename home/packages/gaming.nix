# Gaming-related packages and tools
{ pkgs, waydroid-script, ... }:

{
  home.packages = with pkgs; [
    android-tools # ADB, fastboot, other tools, commands: adb, fastboot
    bottles # Wineprefix manager (GUI)
    ferium # Minecraft mod manager, command: ferium
    heroic # Epic Games/GOG launcher (GUI)
    lutris # Game platform (GUI)
    mangohud # Vulkan overlay for monitoring, command: mangohud
    prismlauncher # Minecraft launcher (GUI)
    protonplus # Proton version manager (GUI)
    protontricks # Proton/Steam helper, command: protontricks
    r2modman # Mod manager (GUI)
    rimsort # Rimworld Mod Manager (GUI)
    samrewritten # Steam achievement manager (GUI)
    waydroid # Android container runtime, command: waydroid
    winetricks # Wine helpers, command: winetricks
    wineWowPackages.staging # Unstable Wine, command: wine
  ];
}
