# Universal packages for software development
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    crush
    gcc
    kubectl
    nil # Nix LSP
    sourcegit
    tokei
    vscodium-fhs
  ];
}
