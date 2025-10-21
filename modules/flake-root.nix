# flake-root flake-parts module
# https://github.com/srid/flake-root
#
# Helps Nix projects locate their root directory, providing both programmatic
# access and environment variable exposure for development shells.
#
# Usage:
#   Add to your flake inputs:
#     flake-root.url = "github:srid/flake-root";
#
#   Then import this module:
#     imports = [ ./modules/flake-root.nix ];

{ inputs, ... }:
{
  imports = [
    inputs.flake-root.flakeModule
  ];

  # projectRootFile - Type: string - Default: "flake.nix"
  # Description: Identifier file used to locate the project root directory
  # flake-root.projectRootFile = "flake.nix";
  # # Alternative: Use a different marker file
  # # flake-root.projectRootFile = ".git/config";

  perSystem = { config, lib, pkgs, ... }: {
    # Available outputs (read-only):

    # config.flake-root.package
    #   Type: package (read-only)
    #   Description: Executable that outputs the root path
    #   Usage: ${lib.getExe config.flake-root.package}

    # config.flake-root.devShell
    #   Type: package (read-only)
    #   Description: Dev shell that exposes $FLAKE_ROOT environment variable
    #   Usage: Add to your dev shell's inputsFrom:
    #   devShells.default = pkgs.mkShell {
    #     inputsFrom = [ config.flake-root.devShell ];
    #   };
  };
}
