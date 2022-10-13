# Neovim config switcher

This is just a temp commit. Not functional yet.

## Dependencies

- rofi
- lua

## Setup

This is the first stab at a working setup.

- Hook up a shortcut to rofi-switcher.sh, e.g. a sxhkd keybinding
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

- Make an alias such as:
alias vim="~/path/to/this/repo/launch.lua"

- Place the respective init.lua entrypoint under each such dir under subpath nvim, so it'll be e.g. chris/nvim/init.lua.

Now you should be able to easily switch which nvim config that will be used the next time you launch vim via the rofi menu.

## Limitations

Configurations are assumed to bootstrap via an init.lua file.

I'd be surprised if any of this would work on e.g. Nintendo Switch or Microsoft Windows
