# Security tool packages
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bitwarden-desktop
    cryptomator
    cryptsetup
    gnupg
    openssl
    veracrypt
    yubioath-flutter
  ];
}
