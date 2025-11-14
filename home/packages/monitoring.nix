# System monitoring packages
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
    ctop
    hyperfine
    iotop
    lm_sensors
    lsof
    ltrace
    pciutils
    strace
    sysstat
    usbutils
  ];
}
