{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lsfg-vk-flake = {
      url = "github:pabloaul/lsfg-vk-flake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      home-manager,
      lsfg-vk-flake,
      ...
    }@inputs:
    let
      systemConfig = import ./config.nix;
      host = systemConfig.host;

      hostConfig = import ./hosts/${host};
      architecture = hostConfig.meta.architecture;
      hostName = hostConfig.meta.hostName;

      mainConfig =
        {
          config,
          lib,
          pkgs,
          ...
        }:
        {
          imports = [
            ./configuration.nix
            hostConfig.module
          ]
          ++ (map (user: ./users/${user}.nix) systemConfig.users);
        };
    in
    {
      formatter.${architecture} = nixpkgs.legacyPackages.${architecture}.nixfmt-tree;
      nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
        system = architecture;
        modules = [
          mainConfig
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit lsfg-vk-flake; };
          }
          lsfg-vk-flake.nixosModules.default
        ];
        specialArgs = { inherit lsfg-vk-flake; };
      };
    };
}
