# devshell flake-parts module
# https://flake.parts/options/devshell.html
#
# devshell provides improved developer shells with better UX than stdenv.mkShell.
# Features include environment variables, commands, packages, and service groups.
#
# Usage:
#   Add to your flake inputs:
#     devshell.url = "github:numtide/devshell";
#
#   Then import this module:
#     imports = [ ./modules/devshell.nix ];

{ inputs, ... }:
{
  imports = [
    inputs.devshell.flakeModule
  ];

  perSystem = { config, pkgs, ... }: {
    # Configure devshells with flake-parts
    # Type: lazy attribute set of submodule
    # Default: { }
    # Note: distinct from devShells (capital S)
    devshells = {
      # default = {
        ## Shell Configuration
        # name - Type: string - Default: "devshell"
        # Description: Project environment identifier
        # devshell.name = "my-project";

        # motd - Type: string - Default: welcome message with hammer emoji
        # Description: Message of the day. Supports 8-bit ANSI colors (e.g., {202})
        #              and formatting tags ({bold}, {reset})
        # devshell.motd = "{bold}{202}Welcome to my project!{reset}";

        # load_profiles - Type: boolean - Default: false
        # Description: Enable loading etc/profiles.d/*.sh scripts
        # devshell.load_profiles = false;

        ## Environment Variables
        # env - Type: list of submodule - Default: [ ]
        # Description: Inject variables into the shell environment
        # env = [
        #   {
        #     name = "MY_VAR";           # Variable identifier (required)
        #     value = "some value";       # Shell-escaped assignment (string/int/bool/package)
        #     # eval = "$()";             # Unevaluated expression allowing $() syntax
        #     # prefix = "/some/path";    # Prepends to PATH-like variables
        #     # unset = false;            # Boolean to remove variable
        #   }
        # ];

        ## Commands
        # commands - Type: list of submodule - Default: [ ]
        # Description: Commands available in the shell
        # commands = [
        #   {
        #     name = "test";              # Command identifier (nullable)
        #     help = "Run tests";         # Single-line description (nullable)
        #     command = "cargo test";     # Bash script; supports custom shebangs (nullable)
        #     # package = pkgs.cargo;     # Specific package to include
        #     category = "testing";       # Grouping label for help menu (default: "[general commands]")
        #   }
        # ];

        ## Packages
        # devshell.packages - Type: list of packages - Default: [ ]
        # Description: Packages from nixpkgs (searchable at https://search.nixos.org/packages)
        # devshell.packages = with pkgs; [
        #   git
        #   curl
        # ];

        # devshell.packagesFrom - Type: list of packages - Default: [ ]
        # Description: Adds build dependencies from specified packages
        # devshell.packagesFrom = [ pkgs.hello ];

        ## Advanced Features
        # prj_root_fallback - Type: submodule or string - Default: { eval = "$PWD"; }
        # Description: Sets PRJ_ROOT when IN_NIX_SHELL/DIRENV_IN_ENVRC undefined
        # Use case: "Use the top-level directory of the working tree"
        # devshell.prj_root_fallback = { eval = "$PWD"; };

        # interactive - Type: attribute set of submodule
        # Description: Define initialization steps
        # Properties: text (script content), deps (dependency list)
        # devshell.interactive = {
        #   init = {
        #     text = "echo 'Initializing...'";
        #     deps = [ ];
        #   };
        # };

        # startup - Type: attribute set of submodule
        # Description: Define startup hooks
        # Properties: text (script content), deps (dependency list)
        # devshell.startup = {
        #   preHook = {
        #     text = "echo 'Starting...'";
        #     deps = [ ];
        #   };
        # };

        # serviceGroups - Type: attribute set of submodule - Default: { }
        # Description: Group long-running processes
        # serviceGroups = {
        #   db = {
        #     description = "Database services";
        #     command = "postgres -D data";
        #   };
        # };

        # meta - Type: attribute set - Default: { }
        # Description: Custom metadata for downstream tooling
        # devshell.meta = {
        #   description = "My project development shell";
        # };
      # };
    };
  };
}
