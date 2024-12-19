# zsh-fnm

A zsh plugin for auto-switching node versions based on project environment or to LTS using [fnm](https://github.com/Schniz/fnm)

## Prerequisites

This plugin is dependant on [fnm](https://github.com/Schniz/fnm).  
Check their docs for installing it.

Also make sure to have set up the `$FNM_DIR` env variable and to have set a default (through `fnm default`).  
The script will complain otherwise.

## Installation

### oh-my-zsh

- `git clone https://github.com/chuvisco88/zsh-fnm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom)/plugins/zsh-fnm`
- add `zsh-fnm` to `plugins=()` in your `.zshrc`

### Others (like antigen, zplugin or zgen)

I don't have experience with those, so I haven't tested it with them.

## Usage

The plugin internally checks for the following files:
- .node-version
- .nvmrc
- package.json 
If one of those is present it will attempt switching through `fnm use`.  
If no such file is existing it will switch back to the default you have set.

## Thanks

This was initially a fork of [vineyardbovines/n.zsh](https://github.com/vineyardbovines/n.zsh) but since has adapted
to use `fnm` instead of `n`. Also the logic has changed quite a bit from the fork.  
Thanks be stated for them.
