{ config, ... }:
{
  sops.secrets.ssid_tp_link_29B4_5G_password = {
    sopsFile = ../../secrets/akatosh.yaml;
  };

  sops.templates.wifi_env = {
    content = ''
      TP_LINK_29B4_5G_PASSWORD=${config.sops.placeholder.ssid_tp_link_29B4_5G_password}
    '';
  };

  networking.networkmanager.ensureProfiles = {
    environmentFiles = [ config.sops.templates.wifi_env.path ];
    profiles."TP-Link_29B4_5G" = {
      connection = {
        id = "TP-Link_29B4_5G";
        type = "wifi";
      };
      wifi = {
        ssid = "TP-Link_29B4_5G";
        mode = "infrastructure";
      };
      wifi-security = {
        key-mgmt = "wpa-psk";
        psk = "$TP_LINK_29B4_5G_PASSWORD";
      };
      ipv4.method = "auto";
      ipv6.method = "ignore";
    };
  };
}
