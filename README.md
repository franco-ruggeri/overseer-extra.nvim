# 🔌 Overseer Extra

A collection of [overseer.nvim](https://github.com/stevearc/overseer.nvim)
templates for popular linters and compilers in Neovim.

This plugin expands [overseer.nvim](https://github.com/stevearc/overseer.nvim)
with a set of extra templates for popular linters and compilers, letting you
effortlessly lint and build your project right from Neovim. All output is
automatically parsed and sent to Neovim diagnostics or quickfix list,
streamlining your workflow for rapid development and feedback.

## ✨ Features

- Plug-and-play overseer templates for widely-used linters and compilers.
- Automatic integration with Neovim diagnostics for linters.
- Automatic integration with Neovim quickfix for compilers.
- Zero configuration required.

## ⚡ Installation

With `lazy.nvim`, just add this plugin to the dependencies of `overseer.nvim`:

```lua
{ 
    "stevearc/overseer.nvim", 
    dependencies = {
        "franco-ruggeri/overseer-extra.nvim" 
    }, 
    opts = {}, 
} 
```

## 🛠️ Supported Tools

Linting templates:

- [Ruff](https://docs.astral.sh/ruff/)
- [Pylint](https://www.pylint.org/)
- [Mypy](https://mypy.readthedocs.io/en/stable/)

Compilation templates:

- [CMake](https://cmake.org/)
- [Latexmk](https://ctan.org/pkg/latexmk?lang=en)

## 🤝 Contributing

All contributions are welcome! For new features, before opening a pull request,
please open an issue to discuss the idea.
