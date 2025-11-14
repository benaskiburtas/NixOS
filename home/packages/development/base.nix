# Universal packages for software development
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains.webstorm # JetBrains WebStorm (GUI)
    tokei # Code counter, command: tokei
    vscodium-fhs # Open source code editor (GUI)
  ];
}
