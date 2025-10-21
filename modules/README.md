# Flake-Parts Modules

This directory contains flake-parts modules for integrating various Nix ecosystem tools and frameworks into your NixOS configuration.

## Available Modules

### Configuration Management

- **home-manager.nix** - User environment and dotfiles management
  - Docs: https://flake.parts/options/home-manager.html
  - Input: `github:nix-community/home-manager`

- **ez-configs.nix** - Simplified configuration management for NixOS, Darwin, and Home Manager
  - Docs: https://flake.parts/options/ez-configs
  - Input: `github:ehllie/ez-configs`

### Development Tools

- **devshell.nix** - Improved developer shells with better UX
  - Docs: https://flake.parts/options/devshell.html
  - Input: `github:numtide/devshell`

- **haskell-flake.nix** - Automatic Haskell project discovery and building
  - Docs: https://flake.parts/options/haskell-flake.html
  - Input: `github:srid/haskell-flake`

### Code Quality & Formatting

- **treefmt-nix.nix** - Declarative formatter configuration with extensive language support
  - Docs: https://flake.parts/options/treefmt-nix.html
  - Input: `github:numtide/treefmt-nix`

- **pre-commit-hooks-nix.nix** - Git pre-commit hooks integration
  - Docs: https://flake.parts/options/pre-commit-hooks-nix
  - Input: `github:cachix/pre-commit-hooks.nix`

### Secrets Management

- **agenix-rekey.nix** - Age-based secret management with rekeying capabilities
  - Docs: https://flake.parts/options/agenix-rekey.html
  - Input: `github:oddlama/agenix-rekey`

### Services

- **services-flake.nix** - NixOS-like services for development environments
  - Docs: https://github.com/juspay/services-flake
  - Input: `github:juspay/services-flake`

## Usage

### Basic Setup

1. Add the required input to your `flake.nix`:
   ```nix
   inputs = {
     # ... other inputs
     treefmt-nix.url = "github:numtide/treefmt-nix";
   };
   ```

2. Import the module in your flake-parts configuration:
   ```nix
   {
     imports = [
       ./modules/treefmt-nix.nix
     ];
   }
   ```

3. Configure the module according to your needs. Each module file contains:
   - Comprehensive inline documentation
   - Type information for all options
   - Default values
   - Example configurations

### Example: Using Multiple Modules

```nix
{
  description = "My NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

    # Module inputs
    home-manager.url = "github:nix-community/home-manager";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    devshell.url = "github:numtide/devshell";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./modules/home-manager.nix
        ./modules/treefmt-nix.nix
        ./modules/devshell.nix
      ];

      systems = [ "x86_64-linux" "aarch64-linux" ];

      perSystem = { config, pkgs, ... }: {
        # Your configuration here
      };
    };
}
```

## Module Documentation

Each module file is self-documenting with:
- Installation instructions
- Complete option reference
- Type annotations
- Default values
- Usage examples

Refer to the individual module files for detailed configuration options.

## Contributing

When adding new modules:
1. Create a new `.nix` file in this directory
2. Follow the existing documentation format
3. Include all available options with types and defaults
4. Provide usage examples
5. Update this README with the new module

## Resources

- [flake-parts Documentation](https://flake.parts/)
- [flake-parts GitHub](https://github.com/hercules-ci/flake-parts)
- [Awesome flake-parts](https://github.com/wearetechnative/awesome-flake-parts)
- [flake-parts Options Reference](https://flake.parts/options.html)
