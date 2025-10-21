# home-manager flake-parts module
# https://flake.parts/options/home-manager.html
#
# Home Manager provides user environment and dotfiles management for Nix/NixOS.
# This module integrates Home Manager configurations with flake-parts.
#
# Usage:
#   Add to your flake inputs:
#     home-manager.url = "github:nix-community/home-manager";
#
#   Then import this module:
#     imports = [ ./modules/home-manager.nix ];

{ inputs, ... }:
{
  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];

  flake = {
    # Instantiated Home Manager configurations
    # Type: lazy attribute set of raw value
    # Default: { }
    # Description: For specific installations. For reusable configurations,
    #              add them to homeModules as modules instead.
    homeConfigurations = {
      # Example:
      # "user@hostname" = inputs.home-manager.lib.homeManagerConfiguration {
      #   pkgs = nixpkgs.legacyPackages.x86_64-linux;
      #   modules = [ ./home.nix ];
      # };
    };

    # Home Manager modules
    # Type: lazy attribute set of module
    # Default: { }
    # Description: Reusable configuration pieces and service modules
    homeModules = {
      # Example:
      # myModule = { config, lib, pkgs, ... }: {
      #   # Your Home Manager module configuration
      # };
    };
  };

  # Note: Simple setups may not require this module if Home Manager
  # flake outputs are defined in a single file.
}
