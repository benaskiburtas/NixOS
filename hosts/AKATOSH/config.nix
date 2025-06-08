let
  hostName = "AKATOSH";
  architecture = "x86_64-linux";
in
{
  meta = {
    inherit hostName architecture;
  };

  module =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      imports = [
        ./hardware-configuration.nix
      ];

      networking.hostName = hostName;

      hardware = {
        xone.enable = true; # Xbox controller support
        bluetooth = {
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
    };
}
