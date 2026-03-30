# Security tool packages
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    age
    cryptsetup
    gnupg
    openssl
    veracrypt
    yubioath-flutter
  ];
}
