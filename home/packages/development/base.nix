# Universal packages for software development
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    docker-compose # Docker automation tool, command: docker-compose
    jetbrains.webstorm # JetBrains WebStorm (GUI)
    python3 # Python programming language, command: python3
    tokei # Code counter, command: tokei
    vscodium-fhs # Open source code editor (GUI)
  ];
}
