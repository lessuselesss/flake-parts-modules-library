# ez-configs flake-parts module
# https://flake.parts/options/ez-configs
#
# Simplifies configuration management for NixOS, Darwin, and Home Manager
# by providing automatic discovery and organization of configuration files.
#
# Usage:
#   Add to your flake inputs:
#     ez-configs.url = "github:ehllie/ez-configs";
#
#   Then import this module:
#     imports = [ ./modules/ez-configs.nix ];

{ inputs, ... }:
{
  imports = [
    inputs.ez-configs.flakeModule
  ];

  flake = {
    ezConfigs = {
      ## Core Options

      # root - Type: null or absolute path - Default: null
      # Description: Base directory for searching configurations and modules
      # root = ./.;

      # globalArgs - Type: attribute set - Default: { }
      # Description: Extra arguments to pass to all configurations
      # globalArgs = {
      #   inherit inputs;
      # };

      # earlyModuleArgs - Type: attribute set - Default: { }
      # Description: Extra arguments to pass to all modules before exporting them
      # earlyModuleArgs = { };

      ## NixOS Configuration

      nixos = {
        # configurationsDirectory - Type: absolute path
        # Default: "${ezConfigs.root}/nixos-configurations"
        # Description: Directory containing NixOS host configurations
        # configurationsDirectory = ./nixos-configurations;

        # modulesDirectory - Type: absolute path
        # Default: "${ezConfigs.root}/nixos-modules"
        # Description: Directory containing shared NixOS modules
        # modulesDirectory = ./nixos-modules;

        # configurationEntryPoint - Type: string - Default: "default.nix"
        # Description: Entry point file name for each configuration
        # configurationEntryPoint = "default.nix";

        # specialArgs - Type: attribute set
        # Description: Arguments passed to all nixosConfigurations
        # specialArgs = {
        #   inherit inputs;
        # };

        # Host-specific options:
        # hosts.<hostname>.importDefault - Type: boolean - Default: true
        # hosts.<hostname>.userHomeModules - Type: list
      };

      ## Darwin Configuration

      darwin = {
        # Same structure as nixos:
        # configurationsDirectory
        # modulesDirectory
        # configurationEntryPoint
        # specialArgs
        # hosts.<hostname>.importDefault
        # hosts.<hostname>.userHomeModules

        # configurationsDirectory = ./darwin-configurations;
        # modulesDirectory = ./darwin-modules;
        # configurationEntryPoint = "default.nix";
        # specialArgs = { };
      };

      ## Home Manager Configuration

      home = {
        # users.<name>.standalone.enable - Type: boolean - Default: false
        # Description: Create standalone user configuration independent of host
        # users.myuser.standalone.enable = true;

        # users.<name>.passInOsConfig - Type: boolean - Default: true
        # Description: Pass osConfig argument to homeConfiguration
        # users.myuser.passInOsConfig = true;

        # configurationsDirectory - Directory containing home configurations
        # modulesDirectory - Directory containing shared home modules
      };

      # Example full configuration:
      # root = ./.;
      # globalArgs = { inherit inputs; };
      #
      # nixos = {
      #   configurationsDirectory = ./hosts;
      #   modulesDirectory = ./modules;
      #   specialArgs = { inherit inputs; };
      #   hosts.myhost = {
      #     importDefault = true;
      #     userHomeModules = [ ];
      #   };
      # };
    };
  };
}
