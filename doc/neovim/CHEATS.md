# Neovim Cheatsheet & Tips

## 📝 General Keymaps

|     Key      | Action              |
| :----------: | ------------------- |
| `<leader>ww` | Write current file  |
| `<leader>wa` | Write all files     |
| `<leader>qq` | Quit and save all   |
| `<leader>qQ` | Quit without saving |
| `<leader>qr` | Restart editor      |

## ✂️ Clipboard & Editing

In this config, `d`, `c`, and `s` are mapped to the "black hole" register (`"_`)
to avoid overwriting clipboard. Use `x` for standard "cut" behavior.

|    Key     | Action                      |
| :--------: | --------------------------- |
| `d` / `dd` | Delete (no yank)            |
| `x` / `xx` | Cut (standard delete)       |
| `c` / `cc` | Change (no yank)            |
| `s` / `S`  | Select/Substitute (no yank) |

## 🪄 LSP & Diagnostics

Mapped under `<localleader>` (usually `\`).

|        Key        | Action                      |
| :---------------: | --------------------------- |
|        `K`        | Hover documentation         |
| `<localleader>ca` | Code Actions                |
| `<localleader>rn` | Rename symbol               |
| `<localleader>gd` | Go to Definition            |
| `<localleader>gr` | Go to References (Snacks)   |
|    `[d` / `]d`    | Previous/Next Diagnostic    |
| `<localleader>ld` | Open line diagnostics float |

## 🔍 Builtin Spell Checker

Neovim has a powerful builtin spell checker. You can toggle it or use these commands:

### Commands

- `:set spell` - Enable spell checking
- `:set nospell` - Disable spell checking
- `:set spelllang=en_us` - Set language (e.g., US English)

### Navigation & Actions

|  Key  | Action                                                                 |
| :---: | ---------------------------------------------------------------------- |
| `]s`  | Jump to the next misspelled word                                       |
| `[s`  | Jump to the previous misspelled word                                   |
| `z=`  | Suggest correctly spelled words for the word under the cursor          |
| `zg`  | Add the word under the cursor to the "good" list (internal dictionary) |
| `zw`  | Mark the word under the cursor as "wrong"                              |
| `zug` | Undo `zg` or `zw` for the word under the cursor                        |

## 📂 Snacks Pickers (Find & Search)

Fuzzy finding and searching powered by `snacks.nvim`.

|     Key      | Action                                   |
| :----------: | ---------------------------------------- |
| `<leader>ff` | Find files                               |
| `<leader>fF` | Find files (including hidden)            |
| `<leader>fr` | Recent files                             |
| `<leader>fb` | Find open buffers                        |
| `<leader>sg` | Live Grep (search in files)              |
| `<leader>sw` | Search word under cursor (Normal/Visual) |
| `<leader>sk` | Search keymaps                           |
| `<leader>sc` | Search/Change colorschemes               |

## 🛠️ Tools & Terminal

|        Key        | Action                          |
| :---------------: | ------------------------------- |
|    `<leader>e`    | Open File Explorer (Snacks)     |
|    `<leader>\`    | Reveal current file in Explorer |
| `<C-/>` / `<C-_>` | Toggle Terminal                 |
|   `<leader>rg`    | Open Lazygit                    |
|   `<leader>rb`    | Open Btop                       |
|    `<leader>.`    | Toggle Scratch Buffer           |

## 📂 Folding (Treesitter)

Folding is configured to use Treesitter logic.

|  Key  | Action                   |
| :---: | ------------------------ |
| `za`  | Toggle fold under cursor |
| `zc`  | Close fold under cursor  |
| `zo`  | Open fold under cursor   |
| `zM`  | Close all folds          |
| `zR`  | Open all folds           |

## ⚙️ Toggles (`<leader>u`)

Quickly toggle editor features.

|     Key      | Action                       |
| :----------: | ---------------------------- |
| `<leader>ud` | Toggle Diagnostics           |
| `<leader>us` | Toggle Spell Checker         |
| `<leader>uw` | Toggle Word Wrap             |
| `<leader>ur` | Toggle Relative Lines        |
| `<leader>ut` | Toggle Treesitter Highlights |
| `<leader>ug` | Toggle Indent Guides         |
