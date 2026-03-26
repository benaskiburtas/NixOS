# Security tool packages
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cryptsetup
    gnupg
    openssl
    veracrypt
    yubioath-flutter
  ];
}
