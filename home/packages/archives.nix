# Archive & compression packages
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lzip # LZMA compression, command: lzip
    p7zip # 7zip support, command: 7z
    unrar # RAR extraction, command: unrar
    xz # XZ compression, commands: xz/unxz
    zip # ZIP compression, commands: zip/unzip
    zstd # Zstandard compression, command: zstd
  ];
}
