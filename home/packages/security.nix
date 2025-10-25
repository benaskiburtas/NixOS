# Security tool packages
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bitwarden # Password manager (GUI)
    cryptomator # Client-side encryption for cloud storage (GUI)
    cryptsetup # Disk encryption, command: cryptsetup
    gnupg # OpenPGP implementation, command: gpg
    openssl # Cryptographic library for SSL/TLS, command: openssl
    veracrypt # Filesystem with on-the-fly encryption (GUI)
    yubioath-flutter # Yubico Authenticator (GUI)
  ];
}
