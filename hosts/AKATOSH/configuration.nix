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

      networking = {
        hostName = hostName;
        networkmanager.enable = true;
      };

      # Localization
      time.timeZone = "Europe/Vilnius";
      i18n.defaultLocale = "en_US.UTF-8";

      # Boot Configuration
      boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };

      hardware = {
        enableRedistributableFirmware = true;
        xone.enable = true;
        bluetooth = {
          enable = true;
          powerOnBoot = true;
        };
        graphics = {
          enable = true;
          # Intel GPU specific packages
          extraPackages = with pkgs; [
            intel-compute-runtime
            intel-gmmlib
            intel-graphics-compiler
            intel-media-driver
            mesa
            vpl-gpu-rt
          ];
        };
      };

      # Desktop Environment
      services = {
        displayManager.sddm.enable = true;
        desktopManager.plasma6.enable = true;
        blueman.enable = true;
      };

      # Audio
      services.pipewire = {
        enable = true;
        alsa = {
          enable = true;
          support32Bit = true;
        };
        # Helps resolve audio output crackling when using heavier audio effects in Easy Effects
        extraConfig.pipewire."custom-adjustments" = {
          "context.properties" = {
            "link.max-buffers" = 64;
            "default.clock.rate" = 48000;
            "default.clock.quantum" = 1024;
            "default.clock.min-quantum" = 1024;
            "default.clock.max-quantum" = 2048;
          };
        };
      };

      # Keyboard
      services.xserver = {
        xkb.layout = "us,lt";
        xkb.options = "grp:win_space_toggle";
      };

      # Shell
      programs.fish.enable = true;
      users.defaultUserShell = pkgs.fish;

      # Gaming Configuration
      programs = {
        gpu-screen-recorder.enable = true;
        gamescope.enable = true;
        steam = {
          enable = true;
          remotePlay.openFirewall = true;
          dedicatedServer.openFirewall = true;
          localNetworkGameTransfers.openFirewall = true;
          gamescopeSession.enable = true;
        };
        gamemode.enable = true;
      };

      ## Lossless Scaling (requires pabloaul/lsfg-vk-flake flake)
      services.lsfg-vk = {
        enable = true;
        ui.enable = true;
      };

      # Virtualization
      virtualisation = {
        docker.enable = true;
        waydroid.enable = true;
        lxd.enable = true;
      };

      # Security
      security = {
        polkit.enable = true;
        rtkit.enable = true;
      };
    };
}