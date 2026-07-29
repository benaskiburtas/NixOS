# Universal packages for software development
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    antigravity-ide-fhs
    gcc
    kubectl
    nil # Nix LSP
    sourcegit
    tokei
    vscodium-fhs
  ];
}
