# Packages for building Go applications
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    go
    gopls
    jetbrains.goland
  ];
}
