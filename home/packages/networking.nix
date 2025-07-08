# Networking diagnostic packages
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    aria2 # Download utility, command: aria2c
    dnsutils # DNS tools, commands: dig, nslookup
    ethtool # Ethernet interface settings, command: ethtool
    iftop # Network bandwidth monitoring, command: iftop
    iperf3 # Network bandwidth measurement, command: iperf3
    ldns # Modern DNS tools, command: drill
    nmap # Network scanning, command: nmap
    socat # Multipurpose relay, command: socat
    xh # Tool for sending HTTP requests, command: xh
  ];
}
