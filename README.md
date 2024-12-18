# zsh-n

A zsh plugin for auto-switching node versions based on project environment or to LTS using [n](https://github.com/tj/n)

## Prerequisites

This plugin is dependant on [n](https://github.com/tj/n), so it means you need to have [n](https://github.com/tj/n) installed.  
Check their docs for installing it.

## Installation

### oh-my-zsh

- `git clone https://github.com/chuvisco88/zsh-n ${ZSH_CUSTOM:-~/.oh-my-zsh/custom)/plugins/zsh-n`
- add `zsh-n` to `plugins=()` in your `.zshrc`

### Others (like antigen, zplugin or zgen)

I don't have experience with those, so I haven't tested it with them.

## Usage

The plugin internally uses `n auto` to automatically switch to the node version provided in the local .n-node-version, .node-version, .nvmrc, or package.json file.  
If no such file is existing, it will switch to node LTS (if not already on it).
