if status is-interactive
    # disable annoying greeting
    set -U fish_greeting
    # env vars
    set -gx EDITOR nvim
    set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/config"
    set -gx VISUAL nvim
    # aliases
    alias zj=zellij
    alias mise-en="mise en --shell=fish"
    # paths
    fish_add_path ~/.local/bin
end
