# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a NixOS configuration repository for managing system configurations using Nix flakes. The repository is currently in early setup phase.

## Available Reference Documentation

The `.claude/docs/reference-libraries/` directory contains XML documentation for the following Nix libraries and tools:

### Core Libraries & Utilities
- **nixpkgs-lib**: Core Nixpkgs library functions
- **flake-utils-repo**: Utilities for writing Nix flakes
- **flake-schemas**: Flake schema definitions
- **flake-file**: Flake file structure reference
- **flake-aspects**: Different aspects of flake configuration
- **flakelight**: Flake configuration framework
- **import-tree**: Import utilities for Nix

### CLI & Development Tools
- **nh**: Yet another nix cli helper (NixOS/Home Manager management tool)
- **nixos-cli**: NixOS command-line utilities
- **nix-direnv**: Fast direnv integration for Nix
- **treefmt-nix**: Tree-based source code formatting for Nix
- **clap-nix**: Command-line argument parsing for Nix
- **inspect**: Nix inspection and debugging tools

### Configuration Management
- **home-manager**: User environment and dotfiles management
- **nix-darwin**: Nix-based macOS configuration management
- **impermanence**: Declarative ephemeral root filesystem management
- **preservation**: Alternative impermanence implementation

### Security & Secrets
- **agenix**: Age-encrypted secrets for NixOS
- **sops-nix**: SOPS (Secrets OPerationS) integration for Nix
- **vulnix**: Security vulnerability scanner for Nix

### Package Management
- **NUR**: Nix User Repository
- **nur-search**: NUR package search utilities
- **nix-snapd**: Snapd integration for NixOS

### Nickel Language Tools
- **nickel-schemastore**: Schema store for Nickel configuration language
- **organist**: Nix-Nickel interoperability for Nix package management
- **json-schema-to-nickel**: Convert JSON Schema to Nickel contracts
- **json-scanner**: Fast JSON scanner for Nickel

When working with these libraries, reference the corresponding XML files for detailed API documentation.

## Flake-Parts Modules

The `modules/` directory contains pre-configured flake-parts modules for integrating various Nix ecosystem tools. These modules follow the flake-parts pattern and provide comprehensive inline documentation.

### Available Modules

**Configuration Management:**
- `home-manager.nix` - User environment and dotfiles management
- `ez-configs.nix` - Simplified NixOS/Darwin/Home Manager configuration organization

**Development Tools:**
- `devshell.nix` - Enhanced developer shells with commands, env vars, and services
- `devenv.nix` - Fast, declarative development environments with extensive language support (40+ languages, services, containers)
- `flake-root.nix` - Discover project root directory with programmatic and environment variable access
- `haskell-flake.nix` - Automatic Haskell project discovery and building
- `input-branches.nix` - Manage flake inputs using Git submodules and branches
- `mission-control.nix` - Dev shell with banner and categorized script commands
- `std.nix` - Standard DevOps framework for organizing Nix configurations

**Code Quality:**
- `treefmt-nix.nix` - Multi-language formatter configuration (80+ formatters supported)
- `pre-commit-hooks-nix.nix` - Git pre-commit hooks integration

**Security:**
- `agenix-rekey.nix` - Age-based secrets management with rekeying support
- `agenix-shell.nix` - Age-encrypted secrets for development shells

**Services & Process Management:**
- `services-flake.nix` - NixOS-like services for development (Postgres, Redis, etc.)
- `process-compose-flake.nix` - Declarative process-compose configurations for multi-process apps

**Infrastructure & System Configuration:**
- `disko.nix` - Declarative disk partitioning and formatting

**CI/CD & Deployment:**
- `hercules-ci-effects.nix` - CI/CD integration with automated flake updates, GitHub Pages, and GitHub releases

**Visualization & Documentation:**
- `nix-topology.nix` - Automatically generate infrastructure and network diagrams from NixOS configurations

### Usage

Each module includes:
- Complete option reference with types and defaults
- Installation instructions
- Example configurations
- Links to upstream documentation

See `modules/README.md` for detailed usage instructions and examples.

## Common NixOS Configuration Commands

### Building and Testing
```bash
# Build the NixOS configuration (when flake.nix exists)
sudo nixos-rebuild build --flake .#<hostname>

# Test the configuration without adding it to bootloader
sudo nixos-rebuild test --flake .#<hostname>

# Switch to the new configuration
sudo nixos-rebuild switch --flake .#<hostname>

# Build and switch in one step
sudo nixos-rebuild switch --flake .#<hostname>
```

### Flake Management
```bash
# Update flake inputs
nix flake update

# Update a specific input
nix flake lock --update-input <input-name>

# Show flake outputs
nix flake show

# Check flake for errors
nix flake check
```

### Development
```bash
# Enter development shell (if devShell is defined)
nix develop

# Format Nix files (if treefmt-nix is configured)
nix fmt
```

## Expected Repository Structure

Typical NixOS flake-based configuration structure:
- `flake.nix` - Main flake configuration
- `flake.lock` - Locked flake inputs
- `configuration.nix` or `nixos/` - System configuration modules
- `home-manager/` - Home Manager configurations (if used)
- `modules/` - Custom NixOS modules
- `overlays/` - Nixpkgs overlays
- `pkgs/` - Custom package definitions

## Architecture Notes

NixOS configurations using flakes typically follow these patterns:

1. **Flake inputs**: External dependencies (nixpkgs, home-manager, etc.)
2. **Flake outputs**: System configurations, packages, devShells
3. **Modular configuration**: Split configuration into logical modules
4. **Hardware configuration**: Hardware-specific settings usually in `hardware-configuration.nix`
5. **User configuration**: User-specific settings, often managed via Home Manager

## Working with Nix

- Nix files use `.nix` extension
- Nix is a purely functional language
- Configuration is declarative - describe desired state, not steps to achieve it
- Use `let ... in` for local bindings
- Import other Nix files with `import ./path.nix` or as modules
- Reference flake inputs in outputs using `inputs.<name>`
