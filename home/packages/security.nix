# Security tool packages
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    age
    cryptsetup
    gnupg
    openssl
    sops
    ssh-to-age
    veracrypt
    yubioath-flutter
  ];
}
