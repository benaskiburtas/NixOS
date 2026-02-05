# Universal packages for software development
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gcc
    jetbrains.webstorm
    kubectl
    nil # Nix LSP
    sourcegit
    tokei
    vscodium-fhs
  ];
}
