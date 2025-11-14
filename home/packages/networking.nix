# Networking diagnostic packages
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    aria2
    dnsutils
    ethtool
    iftop
    iperf3
    ldns
    nmap
    xh
    socat
  ];
}
