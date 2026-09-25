if status is-interactive
    set -U fish_greeting
    set -gx EDITOR nvim
    set -gx VISUAL nvim

    fish_add_path ~/.local/bin
    fish_add_path ~/.cargo/bin
    fish_add_path ~/.local/share/nvim/mason/bin
end
