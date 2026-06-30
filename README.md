# My Dotfiles

I use [Dotbee](https://gitlab.com/rogue87/dotbee) to manage my dotfiles.
I made this tool because I became quite frustrated with `stow`.

```text
Easy to use dotfiles manager

Usage: dotbee <COMMAND>

Commands:
  doctor  show currently used configs and symlinks status
  init    init dotbee
  list    list all available configs
  purge   purge symlinks
  repair  attempt to fix broken symlinks
  switch  select profile
  help    Print this message or the help of the given subcommand(s)

Options:
  -h, --help     Print help
  -V, --version  Print version
```

## Setup Instructions

1. Clone this repository

   ```sh
   git clone https://gitlab.com/rogue87/dotfiles.git
   ```

2. Select desired profile

   ```sh
   dotbee switch laptop # for laptop
   dotbee switch termux # for termux
   ```

Ta-da!, you're good to go :]

### Extra Stuff

- [Neovim Configuration](https://gitlab.com/rogue87/dotfiles/blob/main/doc/neovim/README.md)
