# Universal packages for software development
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains.webstorm
    nil # Nix LSP
    pkgsite
    sourcegit
    tokei
    vscodium-fhs
  ];
}
