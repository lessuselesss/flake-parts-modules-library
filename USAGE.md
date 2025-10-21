# Usage Guide

This flake provides pre-configured flake-parts modules that you can import into your own flakes.

## Quick Start

### 1. Add to Your Flake Inputs

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

    # Add this library
    flake-parts-lib.url = "github:lessuselesss/flake-parts-modules-library";

    # Add the upstream modules you want to use
    treefmt-nix.url = "github:numtide/treefmt-nix";
    devshell.url = "github:numtide/devshell";
  };
}
```

### 2. Import Specific Modules

```nix
{
  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      # Import the pre-configured modules from this library
      imports = [
        inputs.flake-parts-lib.flakeModules.treefmt-nix
        inputs.flake-parts-lib.flakeModules.devshell
      ];

      systems = [ "x86_64-linux" "aarch64-linux" ];

      perSystem = { config, pkgs, ... }: {
        # Now you can configure the modules
        treefmt.programs.nixpkgs-fmt.enable = true;

        devshell.packages = with pkgs; [
          git
          nixpkgs-fmt
        ];
      };
    };
}
```

## Available Modules

You can access any of these modules via `inputs.flake-parts-lib.flakeModules.<name>`:

### Configuration Management
- `home-manager` - User environment and dotfiles management
- `ez-configs` - Simplified configuration management

### Development Tools
- `devshell` - Improved developer shells
- `devenv` - Comprehensive development environments
- `flake-root` - Project root discovery
- `haskell-flake` - Haskell project management
- `input-branches` - Git submodule-based input management
- `mission-control` - Dev shell with command menu
- `std` - Standard DevOps framework

### Code Quality & Formatting
- `treefmt-nix` - Multi-language formatter
- `pre-commit-hooks-nix` - Git pre-commit hooks

### Secrets Management
- `agenix-rekey` - Age-based secrets with rekeying
- `agenix-shell` - Age-encrypted secrets for dev shells

### Services & Process Management
- `services-flake` - NixOS-like services
- `process-compose-flake` - Multi-process orchestration

### Infrastructure & System Configuration
- `disko` - Declarative disk partitioning

### CI/CD & Deployment
- `hercules-ci-effects` - CI/CD integration

### Visualization & Documentation
- `nix-topology` - Infrastructure diagram generation

## Complete Example

Here's a full example using multiple modules:

```nix
{
  description = "My NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

    # Import the modules library
    flake-parts-lib.url = "github:lessuselesss/flake-parts-modules-library";

    # Upstream dependencies
    home-manager.url = "github:nix-community/home-manager";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    devshell.url = "github:numtide/devshell";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    mission-control.url = "github:Platonic-Systems/mission-control";
    flake-root.url = "github:srid/flake-root";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        # Import modules from the library
        inputs.flake-parts-lib.flakeModules.home-manager
        inputs.flake-parts-lib.flakeModules.treefmt-nix
        inputs.flake-parts-lib.flakeModules.devshell
        inputs.flake-parts-lib.flakeModules.pre-commit-hooks-nix
        inputs.flake-parts-lib.flakeModules.mission-control
        inputs.flake-parts-lib.flakeModules.flake-root
      ];

      systems = [ "x86_64-linux" "aarch64-linux" ];

      perSystem = { config, pkgs, ... }: {
        # Configure treefmt
        treefmt = {
          projectRootFile = "flake.nix";
          programs = {
            nixpkgs-fmt.enable = true;
            shellcheck.enable = true;
            shfmt.enable = true;
          };
        };

        # Configure devshell
        devshell.packages = with pkgs; [
          git
          nixpkgs-fmt
        ];

        # Configure pre-commit hooks
        pre-commit.settings.hooks = {
          nixpkgs-fmt.enable = true;
          shellcheck.enable = true;
        };

        # Configure mission-control
        mission-control.scripts = {
          fmt = {
            exec = "nix fmt";
            description = "Format all Nix files";
            category = "Development";
          };

          build = {
            exec = "nix build";
            description = "Build the configuration";
            category = "Build";
          };
        };
      };

      # Configure home-manager at the flake level
      flake = {
        homeConfigurations = {
          "user@hostname" = inputs.home-manager.lib.homeManagerConfiguration {
            pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
            modules = [ ./home.nix ];
          };
        };
      };
    };
}
```

## Using Individual Module Files

If you prefer, you can also copy individual module files from this repository directly into your project:

```bash
# Copy a specific module
curl -o modules/treefmt-nix.nix \
  https://raw.githubusercontent.com/lessuselesss/flake-parts-modules-library/main/modules/treefmt-nix.nix

# Then import it locally
imports = [ ./modules/treefmt-nix.nix ];
```

## Module Documentation

Each module file contains comprehensive inline documentation including:
- All available options with types and defaults
- Usage examples
- Links to upstream documentation

Browse the `modules/` directory or see `modules/README.md` for details on each module.

## Benefits of Using This Library

1. **Pre-configured**: All the boilerplate is handled for you
2. **Well-documented**: Inline comments explain every option
3. **Type-safe**: All options are properly typed
4. **Consistent**: Uniform structure across all modules
5. **Up-to-date**: Regular updates as flake-parts ecosystem evolves
6. **Template-friendly**: Repository is a GitHub template you can fork

## Testing Module Outputs

To verify the flake exports modules correctly:

```bash
# List all available flakeModules
nix flake show github:lessuselesss/flake-parts-modules-library

# Expected output includes:
# └───flakeModules
#     ├───agenix-rekey: NixOS module
#     ├───devshell: NixOS module
#     ├───treefmt-nix: NixOS module
#     └───...
```

## Contributing

If you find issues or want to add more modules:

1. Fork the repository (it's a GitHub template)
2. Add your module following the existing format
3. Update documentation
4. Submit a pull request

See `modules/README.md` for contribution guidelines.
