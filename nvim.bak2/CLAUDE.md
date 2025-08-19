# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Codebase Overview

This is a Neovim configuration written in Lua, organized under the `nvole` namespace. The configuration uses the Lazy.nvim plugin manager and follows a modular structure.

## Architecture

### Core Structure
- **Entry Point**: `/init.lua` loads core modules and Lazy.nvim
- **Core Configuration**: `lua/nvole/core/` contains fundamental Neovim settings
  - `options.lua` - Editor options and settings
  - `keymaps.lua` - Global keybindings (leader key is `<Space>`)
  - `mason-init.lua` - LSP server and tool management
  - `lsp-settings.lua` - Shared LSP configuration

### Plugin Management
- **Plugin Loader**: `lua/nvole/lazy.lua` initializes Lazy.nvim with auto-installation
- **Plugin Directory**: `lua/nvole/plugins/` contains individual plugin configurations
- **Default Colorscheme**: "fullerene" theme is set as default

### Key Plugin Categories
- **File Navigation**: FZF-lua (primary), Telescope (disabled), nvim-tree
- **LSP & Development**: LSP servers via Mason, nvim-cmp completion, DAP debugging
- **Language Support**: Treesitter, specific tools for C/C++, Python, PHP, Java, Rust, LaTeX, Typst
- **AI Assistance**: GitHub Copilot with custom keybindings
- **Git Integration**: fugitive, gitsigns
- **UI Enhancement**: lualine statusline, bufferline, alpha-nvim dashboard

## Development Environment

### LSP Servers (Auto-installed via Mason)
- **Web**: cssls, html, jsonls, intelephense (PHP)
- **Systems**: bashls, cmake, pyright (Python)
- **Enterprise**: jdtls (Java)
- **Writing**: ltex (LaTeX/grammar)

### Manual LSP Setup (excluded from auto-install)
- **clangd** (C/C++) - with extensive configuration flags
- **lua_ls** (Lua) - configured for Neovim development
- **rust_analyzer** (Rust) - via rust-tools.nvim
- **texlab** (LaTeX)
- **tinymist** (Typst) - with auto-export PDF on type

### Formatters & Linters
- **Formatters**: prettier, black, isort, bibtex-tidy, php-cs-fixer
- **Linters**: pylint, eslint_d, markdownlint, cpplint, cmakelint, phpcs

## Key Keybindings

### Leader Key: `<Space>`
- `<leader>ff` - Find files (FZF)
- `<leader>fg` - Live grep (FZF)
- `<leader>fb` - List buffers (FZF)
- `<leader>fr` - Recent files (FZF)
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>s` - Replace word under cursor
- `<leader>gs` - Git status (fugitive)

### Navigation
- `Shift+j/k` - Paragraph navigation (`{` / `}`)
- `Shift+n/m` - Page down/up (`Ctrl+d` / `Ctrl+u`)
- `Shift+h/l` - Buffer navigation
- `Shift+q` - Close buffer

### Window Management
- `<leader>v` - Vertical split
- `<leader>h` - Horizontal split
- `Ctrl+hjkl` - Window navigation
- `Ctrl+arrows` - Window resize

### AI Assistance (Copilot)
- `Ctrl+j` - Accept suggestion (insert mode)
- `Ctrl+]` - Next suggestion (insert mode)
- `Ctrl+[` - Previous suggestion (insert mode)  
- `Ctrl+c` - Dismiss suggestion (insert mode)
- `Ctrl+\` - Trigger suggestion manually (insert mode)

### AI Chat (Copilot Chat)
- `<leader>cc` - Open Copilot Chat
- `<leader>ce` - Explain code
- `<leader>cr` - Review code
- `<leader>cf` - Fix code issues
- `<leader>co` - Optimize code
- `<leader>cd` - Generate documentation
- `<leader>ct` - Generate tests

### Document Compilation
- `<localleader>ll` - Save and compile to PDF (LaTeX/Typst)
- `<localleader>lv` - Compile and view PDF externally (Typst only)
- `<localleader>lp` - Preview PDF in vertical split (Typst only)
- `<localleader>lt` - Preview PDF in new tab (Typst only)
- `<localleader>lh` - Start web preview (Typst only)
- `<localleader>ls` - Stop web preview (Typst only)
- `<localleader>lw` - Start watch mode for auto-compilation (Typst only)

## File Organization Patterns

### Plugin Configuration
Each plugin has its own file in `lua/nvole/plugins/` that returns a Lazy.nvim spec table. Common pattern:
```lua
return {
    "plugin/name",
    dependencies = { ... },
    config = function() ... end,
    opts = { ... },
}
```

### Core Module Pattern
Core modules use the `local M = {}` pattern with a `setup()` function:
```lua
local M = {}
function M.setup()
    -- configuration logic
end
return M
```

## Special Configurations

### FZF vs Telescope
- FZF-lua is the primary fuzzy finder (enabled)
- Telescope is included but disabled by default
- Both use identical keybindings for easy switching

### LSP Handler Exclusions
Some LSP servers have custom handlers or are disabled:
- `jdtls` - Uses nvim-jdtls for advanced Java features
- `lua_ls` - Custom Neovim-specific configuration
- `ltex` - Grammar checking with custom language settings
- `clangd` - Extensive command-line flags for C/C++ development

### Text Width & Formatting
- Default text width: 80 characters
- Color column at 81 (`+1`)
- Tab width: 4 spaces (expanded)
- Line breaking enabled with smart indentation

### Auto-save Configuration
- **LaTeX files**: Auto-save on text change, focus loss, and buffer switch
- **Typst files**: Auto-save with debounced PDF compilation (500ms delay)
- **VimTeX**: Warnings filtered, quickfix disabled for smoother experience
- **Typst**: Direct PDF compilation, no web server needed

### Typst Integration
- **Syntax support**: `typst.vim` for highlighting and basic features
- **Multiple preview modes**:
  - PDF compilation: Direct PDF output using `typst compile`
  - In-editor preview: PDF in vertical split or new tab
  - Web preview: Real-time browser-based preview
  - Watch mode: Continuous background compilation
- **Auto-compilation**: 500ms debounced compilation on text changes
- **Flexible workflow**: Choose between PDF viewers, in-editor, or web preview

### AI Integration
- **Copilot**: Enabled for most file types, disabled for git commits and sensitive files
- **Custom keybindings**: Non-conflicting mappings for suggestion navigation