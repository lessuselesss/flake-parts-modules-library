# std flake-parts module
# https://flake.parts/options/std.html
#
# Adds definitions from the Standard DevOps framework to your flake.
# Organizes and disciplines your Nix and integrates high quality vertical
# DevOps tooling from the Nix Ecosystem.
#
# Usage:
#   Add to your flake inputs:
#     std.url = "github:divnix/std";
#
#   Then import this module:
#     imports = [ ./modules/std.nix ];

{ inputs, ... }:
{
  imports = [
    inputs.std.flakeModule
  ];

  # The std module provides organizational structure for Nix configurations
  # and integrates DevOps framework functionality.
  #
  # For detailed configuration options, consult:
  #   - https://github.com/divnix/std
  #   - The module's implementation files
  #
  # Example usage varies depending on your DevOps workflow and
  # the specific Standard framework features you want to leverage.
}
