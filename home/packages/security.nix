# Security tool packages
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bitwarden # Password manager (GUI)
    cryptsetup # Disk encryption, command: cryptsetup
    gnupg # OpenPGP implementation, command: gpg
    openssl # Cryptographic library for SSL/TLS, command: openssl
    veracrypt # Filesystem with on-the-fly encryption (GUI)
  ];
}
