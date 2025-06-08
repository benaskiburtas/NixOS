# System monitoring packages
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btop # Resource monitor, command: btop
    hyperfine # Benchmarking tool, command: hyperfine
    iotop # Disk I/O monitoring, command: iotop
    lm_sensors # Hardware monitoring, commands: sensors, fancontrol
    lsof # List open files, command: lsof
    ltrace # Library call tracer, command: ltrace
    pciutils # PCI devices, command: lspci
    strace # System call tracer, command: strace
    sysstat # System performance tools, commands: sar, iostat
    usbutils # USB devices, command: lsusb
  ];
}
