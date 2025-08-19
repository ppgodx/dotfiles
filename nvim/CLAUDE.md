# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

### Code Formatting
```bash
# Format Lua code using stylua configuration
stylua .
```

### Package Management
```bash
# All plugins are managed through Lazy.nvim
# Plugin sync and installation happens automatically when starting Neovim
nvim
```

## Architecture Overview

This is a modern Neovim configuration built on top of LazyVim, featuring AI-assisted development tools and performance optimizations.

### Core Structure

- **Entry Point**: `init.lua` - Bootstraps the entire configuration by requiring `config.lazy`
- **Plugin Management**: Uses Lazy.nvim with LazyVim as the base framework
- **Configuration Directory**: `lua/config/` contains core configuration modules
- **Plugin Directory**: `lua/plugins/` contains individual plugin configurations

### Key Configuration Modules

- `lua/config/lazy.lua` - Lazy.nvim setup and plugin loading configuration
- `lua/config/options.lua` - Neovim core options, filetype associations, and UI settings
- `lua/config/keymaps.lua` - Custom key mappings and shortcuts
- `lua/config/utils.lua` - Utility functions including fold text formatting, theme toggling, and terminal helpers
- `lua/config/autocmds.lua` - Autocommands for various file types and events
- `lua/config/telescope.lua` - Telescope search and picker configurations
- `lua/config/prompts.lua` - Avante AI prompts and configurations

### Plugin Configuration Architecture

Each plugin is configured in its own file in `lua/plugins/`. Key plugins include:

- `avante.lua` - AI-assisted coding with Copilot integration
- `blink.lua` - Fast completion engine with context-aware source selection
- `lsp.lua` - Language Server Protocol configuration with custom keymaps
- `core.lua` - LazyVim base configuration overrides
- `catppuccin.lua` - Theme configuration
- `bufferline.lua`, `lualine.lua` - UI components

### Custom Features

- **Theme Toggle**: Switch between Catppuccin Mocha and TokyoNight Moon themes
- **Smart Completion**: Context-aware completion sources (LSP in code, buffer in comments)
- **Custom Fold Text**: Syntax-highlighted fold text using Tree-sitter
- **Terminal Integration**: Custom terminal keymaps and floating terminal support
- **AI Integration**: Avante.nvim with custom prompts for code assistance

### User-Specific Configuration

The configuration includes conditional logic based on `vim.env.USER == "abz"` for user-specific settings like Python LSP selection (Pylance vs BasedPyright).

### Development Tools

- **Testing**: Neotest integration for running tests
- **Task Running**: Overseer.nvim for task management
- **Git Integration**: Gitsigns with custom navigation keymaps
- **File Navigation**: Oil.nvim, Grapple for bookmarking, and enhanced Telescope
- **Diagnostics**: Tiny-inline-diagnostic for improved error display
- **Symbol Usage**: Real-time display of symbol references and definitions

### Filetype Extensions

Custom filetype associations in `options.lua` for:
- `.env` files as config filetype
- GitHub Actions workflows as `gha` filetype
- GoMod and GoSum file recognition
- Requirements.txt files as config filetype

### Performance Optimizations

- Disabled runtime plugins (gzip, tar, zip, tutor)
- Custom quickfix formatting function
- Optimized plugin loading with LazyVim
- Context-sensitive completion source loading