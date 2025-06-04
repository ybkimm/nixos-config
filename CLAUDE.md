# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal NixOS/nix-darwin configuration repository managing system and user configurations across:
- **devvm**: NixOS virtual machine (x86_64-linux)
- **ybkimm-mbp**: macOS system with Apple Silicon (aarch64-darwin)

## Common Commands

### Darwin (macOS) Systems
```bash
# Apply configuration changes
darwin-rebuild switch --flake .#ybkimm-mbp

# Build without applying (for testing)
darwin-rebuild build --flake .#ybkimm-mbp

# Check flake validity
nix flake check
```

### NixOS Systems
```bash
# Apply configuration changes
nixos-rebuild switch --flake .#devvm

# Build without applying (for testing)
nixos-rebuild build --flake .#devvm
```

### Development Commands
```bash
# Update flake inputs
nix flake update

# Build a specific package
nix build .#pkgs.<system>.<package>
# Example: nix build .#pkgs.aarch64-darwin.ssh3

# Enter development shell for a package
nix develop .#pkgs.<system>.<package>
```

## Architecture

The configuration uses Nix flakes with this structure:

- **flake.nix**: Entry point defining inputs, host configurations, and custom packages
- **hosts/**: Machine-specific configurations
  - Each host uses `mkHost` helper from `utils/mkHost/`
  - Contains `configuration.nix` for system settings
  - May include host-specific apps and services
- **users/**: User configurations managed by home-manager
  - `default/`: Base configuration with common developer tools
  - `ybkimm/`: Extended configuration inheriting from default
- **pkgs/**: Custom package definitions (bun, ssh3, go-capnp)
- **overlays/**: Package modifications applied to nixpkgs

### Key Design Patterns

1. **User configuration inheritance**: `ybkimm` user extends `default` user configuration
2. **Modular app configuration**: Each application has its own `default.nix` under `apps/`
3. **Cross-platform support**: Uses `lib.optionalAttrs` and system checks for platform-specific configuration
4. **Neovim configuration**: Extensive nixvim setup with LSP servers and plugins defined declaratively

### Custom Helper Functions

- **mkHost**: Creates host configurations with standardized structure
- **addUser**: Merges user configurations with home-manager integration

## Working with Configurations

When modifying configurations:
1. System-wide changes go in `hosts/<hostname>/configuration.nix`
2. User-specific tools go in `users/<username>/apps/<app>/default.nix`
3. New packages go in `pkgs/<package>/default.nix`
4. Test changes with `darwin-rebuild build` before switching
5. The fish shell includes custom functions like `claude` for AI assistance