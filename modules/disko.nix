# disko flake-parts module
# https://flake.parts/options/disko.html
#
# Declarative disk partitioning and formatting using Nix.
# Creates diskoConfigurations flake output for use with disko and disko-install tools.
#
# Usage:
#   Add to your flake inputs:
#     disko.url = "github:nix-community/disko";
#
#   Then import this module:
#     imports = [ ./modules/disko.nix ];

{ inputs, ... }:
{
  imports = [
    inputs.disko.flakeModules.default
  ];

  flake = {
    # diskoConfigurations - Type: lazy attribute set of raw values
    # Default: { }
    # Description: Stores instantiated Disko configurations used by disko
    #              and disko-install tools
    # diskoConfigurations = {
    #   my-machine = {
    #     ## Device Configuration
    #     # Supports nested device definitions including:
    #     # - Disk partitioning
    #     # - Filesystem formatting
    #     # - Mount point configuration
    #
    #     # disko.devices = {
    #     #   disk = {
    #     #     main = {
    #     #       device = "/dev/sda";
    #     #       type = "disk";
    #     #       content = {
    #     #         type = "gpt";
    #     #         partitions = {
    #     #           boot = {
    #     #             size = "1M";
    #     #             type = "EF02";  # BIOS boot
    #     #           };
    #     #           ESP = {
    #     #             size = "512M";
    #     #             type = "EF00";
    #     #             content = {
    #     #               type = "filesystem";
    #     #               format = "vfat";
    #     #               mountpoint = "/boot";
    #     #             };
    #     #           };
    #     #           root = {
    #     #             size = "100%";
    #     #             content = {
    #     #               type = "filesystem";
    #     #               format = "ext4";
    #     #               mountpoint = "/";
    #     #             };
    #     #           };
    #     #         };
    #     #       };
    #     #     };
    #     #   };
    #     # };
    #   };
    # };
    #
    # Note: Configurations are first discovered under diskoConfigurations
    #       flake output, then fall back to disko module settings from
    #       nixosConfigurations if not found.
    #
    # For comprehensive documentation:
    #   https://github.com/nix-community/disko/tree/master#readme
  };
}
