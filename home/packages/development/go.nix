# Packages for building Go applications
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    delve
    go
    golangci-lint
    gopls
    gotools
    jetbrains.goland
  ];
}
