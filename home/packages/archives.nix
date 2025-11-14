# Archive & compression packages
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lzip
    p7zip
    unrar
    xz
    zip
    zstd
  ];
}
