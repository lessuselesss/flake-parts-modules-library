# agenix-rekey flake-parts module
# https://flake.parts/options/agenix-rekey.html
#
# agenix-rekey provides age-based secret management with rekeying capabilities
# for NixOS and Home Manager configurations.
#
# Usage:
#   Add to your flake inputs:
#     agenix-rekey.url = "github:oddlama/agenix-rekey";
#
#   Then import this module:
#     imports = [ ./modules/agenix-rekey.nix ];

{ inputs, ... }:
{
  imports = [
    inputs.agenix-rekey.flakeModule
  ];

  # Top-level flake configuration
  flake = {
    # agenix-rekey apps specific to your flake
    # Type: lazy attribute set of package
    # Default: Automatically filled by agenix-rekey
    # Description: Used by the `agenix` wrapper script
    # agenix-rekey = { };
  };

  perSystem = { config, pkgs, ... }: {
    agenix-rekey = {
      # The agenix-rekey wrapper script `agenix`
      # Type: package
      # Default: <agenix script derivation from agenix-rekey>
      # Description: We recommend adding this to your devshell
      # package = ...;

      # Encryption/decryption tool
      # Type: package
      # Default: pkgs.rage
      # Description: Compatible with pkgs.age and pkgs.rage
      # agePackage = pkgs.rage;

      # Whether to collect home manager configurations automatically
      # Type: boolean
      # Default: true
      # Description: Collect from specified NixOS configurations
      # collectHomeManagerConfigurations = true;

      # All home manager configurations for rekeying
      # Type: lazy attribute set
      # Default: Filtered self.homeConfigurations
      # Description: Home manager configurations that should be considered for rekeying
      # homeConfigurations = { };

      # All nixosSystems for rekeying
      # Type: lazy attribute set
      # Default: Filtered self.nixosConfigurations
      # Description: NixOS systems that should be considered for rekeying
      # nixosConfigurations = { };

      # The package set to use
      # Type: unspecified value
      # Default: pkgs
      # Description: Package set for defining agenix-rekey scripts
      # pkgs = pkgs;

      # Example configuration:
      # agePackage = pkgs.rage;
      # collectHomeManagerConfigurations = true;
    };
  };
}
