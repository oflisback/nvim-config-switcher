Disclaimer: This is not really functional yet, try it on your own risk. >:)

# Neovim config switcher

This project aims to simplify switching between multiple neovim configs, either by setting which config should be used the next time neovim is started, or by
switching configurations at runtime from inside neovim.

## Configurations

## Components

### Launcher

`launcher.lua` is a script that will launch neovim with the pre-selected configuration, set either via the rofi menu or select-config.lua.

To make use of it, configure an alias in your shell config such as for z-shell by adding the following line to .zshrc:

```
alias vim="/path/to/nvim-config-switcher/launch.lua"
```

Then when running `vim` the launcher will be used to start neovim with the configured configuration.

### Neovim plugin

The neovim plugin adds two commands:

NVCSwitch - switch to another available configuration.
NVCList - list available configurations

#### Installation

[Packer](https://github.com/wbthomason/packer.nvim)

```
use 'oflisback/nvim-config-switcher'
```

### Rofi menu

Use the rofi menu to list available configurations and select what configuration to be used when launching vim via the launcher.

Map a keyboard shortcut to make it convenient to launch the rofi menu.

## Dependencies

- lua
- rofi (optional)

## Setup

- Create ~/.config/nvims/config.lua looking something like:

```
local configs = {
  chris = {
    subpath = "chris"
  },
  ola = {
    subpath = "ola"
  }
}

return configs
```

- Make ~/.config/nvims/envs dir and one subpath for each label in your config e.g.:

```
❯ tree -L 1
.
├── chris
└── ola
```

- Place the respective init.lua entrypoint under each such dir under subpath nvim, so it'll be e.g. chris/nvim/init.lua.

Now you should be able to easily switch which nvim config that will be used the next time you launch vim via the rofi menu.

## Limitations

Configurations are assumed to bootstrap via an init.lua file.

This is tested on arch linux with z-shell, it may or may not work on other setups.
