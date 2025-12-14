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
        firewall = {
          enable = true;
          allowedTCPPorts = [
            80
            443
            2022
            {
              from = 1714;
              to = 1764;
            } # KDE Connect
            8080
            8096 # Jellyfin
            8920 # Jellyfin
          ];
          allowedUDPPorts = [
            {
              from = 1714;
              to = 1764;
            } # KDE Connect
            7359 # Jellyfin
          ];
        };
        hostName = hostName;
        networkmanager.enable = true;
        nftables.enable = true;
      };

      time = {
        timeZone = "Europe/Vilnius";
        hardwareClockInLocalTime = true;
      };
      i18n.defaultLocale = "en_US.UTF-8";

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

      services = {
        displayManager.sddm.enable = true;
        desktopManager.plasma6.enable = true;
        blueman.enable = true;
        pcscd.enable = true;

        xserver = {
          xkb.layout = "us,lt";
          xkb.options = "grp:win_space_toggle";
        };

        pipewire = {
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

        jellyfin = {
          enable = true;
          openFirewall = true;
          dataDir = "/var/lib/jellyfin";
        };

        ## Lossless Scaling (requires pabloaul/lsfg-vk-flake flake)
        lsfg-vk = {
          enable = true;
          ui.enable = true;
        };
      };

      users.defaultUserShell = pkgs.fish;

      programs = {
        fish.enable = true;

        # Gaming Configuration
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
        kdeconnect.enable = true;
      };

      virtualisation = {
        docker.enable = true;
        incus.enable = true;
      };

      security = {
        polkit.enable = true;
        rtkit.enable = true;
      };
    };
}
