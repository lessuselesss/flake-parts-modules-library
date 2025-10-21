# mission-control flake-parts module
# https://flake.parts/options/mission-control.html
#
# Creates a dev shell with a banner and categorized script commands.
# Provides a convenient command menu and wrapper for project scripts.
#
# Usage:
#   Add to your flake inputs:
#     mission-control.url = "github:Platonic-Systems/mission-control";
#
#   Then import this module:
#     imports = [ ./modules/mission-control.nix ];

{ inputs, ... }:
{
  imports = [
    inputs.mission-control.flakeModule
  ];

  perSystem = { config, pkgs, ... }: {
    mission-control = {
      ## Core Configuration

      # banner - Type: string - Default: generated package
      # Description: The generated shell banner displayed on shell entry
      # banner = ''
      #   Welcome to my project!
      #   Available commands are listed below.
      # '';

      # devShell - Type: package (read-only)
      # Description: A devShell containing the banner and wrapper
      # Access via: config.mission-control.devShell

      # wrapper - Type: package - Default: generated package
      # Description: The generated wrapper script
      # wrapper = pkgs.writeShellScript "wrapper" "...";

      # wrapperName - Type: string - Default: ","
      # Description: The name of the wrapper script
      # wrapperName = ",";

      ## Scripts Configuration

      # scripts - Type: attribute set of submodules - Default: { }
      # Description: List of scripts to be added to the shell
      scripts = {
        # build = {
        #   ## Script Definition
        #
        #   # exec - Type: string or package - Required
        #   # Description: Script or package to execute
        #   #              Supports $FLAKE_ROOT environment variable
        #   exec = "nix build";
        #
        #   # description - Type: null or string - Default: null
        #   # Description: Displayed in the banner and help menu
        #   description = "Build the project";
        #
        #   # category - Type: string - Default: "Commands"
        #   # Description: Groups script under specified category
        #   category = "Build";
        #
        #   # cdToProjectRoot - Type: boolean - Default: true
        #   # Description: Change working directory to project root before running
        #   cdToProjectRoot = true;
        # };

        # test = {
        #   exec = "nix flake check";
        #   description = "Run tests";
        #   category = "Development";
        # };

        # fmt = {
        #   exec = "nix fmt";
        #   description = "Format code";
        #   category = "Development";
        # };

        # update = {
        #   exec = "nix flake update";
        #   description = "Update flake inputs";
        #   category = "Maintenance";
        # };
      };
    };
  };
}
