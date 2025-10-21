# Nix Reference Libraries

This directory contains complete repository snapshots of essential Nix libraries and tools, packaged as XML files by Repomix for AI-assisted development.

## Available References

### Core Libraries

#### nixpkgs-lib
**Path:** `.claude/docs/reference-libraries/nixpkgs-lib.xml` (38,944 lines)

The core Nixpkgs library containing essential utility functions for Nix development. Includes modules for:
- File system operations (`lib.fileset`, `lib.path`)
- Network utilities (`lib.network`)
- System definitions (`lib.systems`)
- Module system functionality
- String, list, and attribute set manipulation
- Deprecated functions (`lib.deprecated`)

**Key References:**
- Main README: line 36313 (`lib/README.md`)
- Main library file: line 25224 (`lib/default.nix`)
- Fileset README: line 3117 (`lib/fileset/README.md`)
- Path README: line 6765 (`lib/path/README.md`)
- Deprecated README: line 913 (`lib/deprecated/README.md`)
- Flake definition: line 38936 (`flake.nix`)

### Flake Utilities

#### flake-utils-repo
**Path:** `.claude/docs/reference-libraries/flake-utils-repo.xml` (1,350 lines)

Utilities for writing Nix flakes with less boilerplate. Provides functions like:
- `eachDefaultSystem` - Generate outputs for common system types
- `simpleFlake` - Simplified flake creation
- `filterPackages` - Package filtering utilities
- `flattenTree` - Flatten nested attribute sets

**Key References:**
- README: line 1021
- Main library: line 396 (`default.nix`)
- Flake definition: line 697 (`flake.nix`)

#### flake-file
**Path:** `.claude/docs/reference-libraries/flake-file.xml` (2,475 lines)

A flake file generation and management system. Contains:
- Flake-parts integration modules
- Dendritic modules for flake composition
- Options for flake file structure
- Input management utilities
- Lock file pruning functionality
- Write hooks and check hooks

**Key References:**
- README: line 2092
- Flake definition: line 1882 (`flake.nix`)

#### flake-schemas
**Path:** `.claude/docs/reference-libraries/flake-schemas.xml` (627 lines)

Flake schema definitions and validation utilities for ensuring flake outputs conform to expected structures.

**Key References:**
- README: line 535
- Flake definition: line 120 (`flake.nix`)

#### flake-aspects
**Path:** `.claude/docs/reference-libraries/flake-aspects.xml` (646 lines)

Testing and validation framework (Checkmate) for Nix flakes. Provides:
- Automated flake checking
- Test harness for flake outputs
- Quality assurance tooling

**Key References:**
- README: line 553
- Main library: line 233 (`default.nix`)
- Flake definition: line 264 (`flake.nix`)

### Development Tools

#### treefmt-nix
**Path:** `.claude/docs/reference-libraries/treefmt-nix.xml` (8,319 lines)

Tree-based source code formatting for Nix projects. Includes formatter configurations for 100+ languages including:
- Nix (Alejandra, Nixfmt)
- Python (Black, isort)
- JavaScript/TypeScript (Prettier, Biome, Deno)
- Go (gofmt, gofumpt, goimports)
- Rust, Haskell, Java, C/C++, and many more
- Configuration file formats (JSON, YAML, TOML)

**Key References:**
- README: line 7805
- Main entry point: line 7045 (`default.nix`)
- Flake definition: line 7387 (`flake.nix`)
- Example formatters: lines 47-200+ (formatter-*.toml examples)

#### clap-nix
**Path:** `.claude/docs/reference-libraries/clap-nix.xml` (1,408 lines)

Command-line argument parsing library for Nix. Features:
- Long and short option parsing
- Subcommand support
- Boolean flags and value arguments
- Integration with Nix module system
- Automatic documentation generation

**Key References:**
- README: line 1185
- Main library: line 898 (`default.nix`)
- Flake definition: line 948 (`flake.nix`)
- Test suite: lines 82-180+ (test/*.nix files)

#### import-tree
**Path:** `.claude/docs/reference-libraries/import-tree.xml` (1,128 lines)

Utilities for importing directory trees in Nix. Enables:
- Automatic discovery and import of Nix files
- Directory structure-based module loading
- Simplified module organization
- Test cases showing import patterns

**Key References:**
- README: line 792
- Main library: line 437 (`default.nix`)
- Flake definition: line 582 (`flake.nix`)
- Example tree structure: lines 50-75 (tree/ directory)

#### flakelight
**Path:** `.claude/docs/reference-libraries/flakelight.xml` (4,130 lines)

Simplified flake configuration framework that reduces boilerplate. Features:
- Modular flake configuration system
- Auto-discovery of packages and modules
- Built-in defaults for common patterns
- Integration with formatters, devShells, and overlays
- Extensive API for customization

**Key References:**
- README: line 3899
- API Guide: line 2454 (`API_GUIDE.md`)
- Main library: line 3647 (`default.nix`)
- Flake definition: line 3855 (`flake.nix`)

#### inspect
**Path:** `.claude/docs/reference-libraries/inspect.xml` (885 lines)

Flake inspector utility from DeterminateSystems. Used for:
- Analyzing flake structure and outputs
- Validating flake contents
- Testing framework for flakes
- Generating flake documentation

**Key References:**
- README: line 738
- Flake definition: line 590 (`flake.nix`)
- Test corpus: lines 47-56 (example test cases)

### Configuration Management

#### home-manager
**Path:** `.claude/docs/reference-libraries/home-manager.xml` (193,671 lines)

Comprehensive home directory configuration system for NixOS and standalone Nix. Includes:
- 600+ module options for configuring applications
- Desktop environment configurations (i3, sway, GNOME, KDE, etc.)
- Shell configurations (bash, zsh, fish, etc.)
- Development tools (git, vim, emacs, VSCode, etc.)
- Service management via systemd/launchd
- Cross-platform support (Linux, macOS, BSD)

**Key References:**
- README: line 193474
- Main entry point: line 193204 (`default.nix`)
- Flake definition: line 193322 (`flake.nix`)
- CLI tool: line ~100000+ (`home-manager/home-manager` script)
- Module examples: Browse via directory structure

### CLI Tools

#### nixos-cli
**Path:** `.claude/docs/reference-libraries/nixos-cli.xml` (16,117 lines)

Modern command-line interface for NixOS system management. Written in Go, provides:
- System activation and switching
- Package and profile management
- NixOS installation utilities
- Container management
- Configuration validation
- User-friendly alternatives to traditional NixOS commands

**Key References:**
- README: line 15990
- Flake definition: line 14857 (`flake.nix`)
- Main commands: lines 150-400+ (cmd/ directory structure)
- Activation logic: line ~3000+ (`cmd/activate/` modules)

## Usage

These XML files contain complete repository contents and can be referenced when:
- Looking up function signatures and usage examples
- Understanding library architecture
- Finding implementation details
- Exploring available formatters and tools
- Learning Nix patterns and best practices

Each file is organized with:
1. File summary and purpose
2. Directory structure
3. Complete file contents with paths

To search within these references, use standard XML parsing or text search tools.
