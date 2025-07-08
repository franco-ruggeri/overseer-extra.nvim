# Overseer Extra

A Neovim plugin that provides extra [Overseer.nvim](https://github.com/stevearc/overseer.nvim) templates for popular linters and build tools, enabling smooth integration of diagnostics and compilation tasks into your workflow. This plugin expands beyond the built-in Overseer templates, offering drop-in support for common language tooling.

## Features

- Extra overseer templates for popular linters and compilers
- Automatic project detection (Python, C/C++, LaTeX)
- Seamless integration with Overseer task management UI

## Installation

Use your favorite Neovim plugin manager. For example, with [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "your/repo/overseer-lint.nvim",
  dependencies = { "stevearc/overseer.nvim" },
  config = function()
    -- Any optional setup if needed
  end,
}
```

> **Note**: This plugin depends on [Overseer.nvim](https://github.com/stevearc/overseer.nvim).

## Setup

No setup is required for basic usage. After installation, additional Overseer templates for supported linters and build tools will be available automatically when you open a relevant project.

See below for the list of supported tools and usage examples.
