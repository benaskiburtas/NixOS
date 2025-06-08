# Host-specific settings for AKATOSH system
{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Hostname
  networking.hostName = "AKATOSH";

  # Host-specific hardware features
  hardware = {
    xone.enable = true; # Xbox controller support
    bluetooth = {
      # Bluetooth support
      enable = true;
      powerOnBoot = true;
    };
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        vpl-gpu-rt # Hardware acceleration for Intel GPUs
      ];
    };
  };
}
