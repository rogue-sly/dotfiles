if status is-interactive
    # disable annoying greeting
    set -U fish_greeting
    # env vars
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/config"
    # aliases
    alias zj=zellij
    # paths
    fish_add_path ~/.local/bin
end
