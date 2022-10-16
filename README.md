# Neovim config switcher

This project aims to simplify switching between multiple neovim configurations/environments, either by setting which environment should be used the next time neovim is started, or by switching environment at runtime from inside neovim.

## Installation

1. Clone this repo.
2. Run `setup` to generate a config file and two example environments.
3. Inspect or modify `~/.config/nvcs/config.lua`. If you add entries you should also create corresponding subdirectories with the same structure as the included `light` and `dark` environments.
4. Setup an alias for `launcher`, see below.
5. Run `nvcs` or `rofi-switcher` to select an environment to be used next time `launcher` is executed.
6. Optionally install the neovim plugin to be able to switch environment from inside neovim.

## Components

### setup

Run `setup` to create the directory `~/.config/nvcs/` and an example `config.lua` lua file. Two example neovim environments are also copied to that directory.

### launcher

`launcher` will launch neovim with the pre-selected environment, set either via the rofi menu or nvcs.

To make use of it, create an alias in your shell config such as for z-shell by adding the following line to .zshrc:

```
alias vim="/path/to/nvim-config-switcher/launch"
```

Then when running `vim` the launcher will be used to start neovim with the pre-selected environment.

### nvcs

Use `nvcs` to list available environments and to select which environment that should be the default one next time `launcher` is
started.

### Neovim plugin

The neovim plugin adds two commands:

- NVCSwitch - Switch to another available environment.
- NVCSList - List available environments.

#### Installation

[Packer](https://github.com/wbthomason/packer.nvim)

```
use 'oflisback/nvim-config-switcher'
```

### Rofi menu

Use the rofi menu to list available environments and select which environment that is to be used when launching neovim via the launcher.

Map a keyboard shortcut to make it convenient to launch the rofi menu.

## Dependencies

- lua
- rofi (optional)

## Limitations

This is tested on arch linux with z-shell, it may or may not work on other setups.
