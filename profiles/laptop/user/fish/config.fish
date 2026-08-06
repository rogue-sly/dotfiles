if status is-interactive
    set -U fish_greeting

    set -gx EDITOR nvim
    set -gx VISUAL nvim
    set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/config"

    alias zj=zellij
end
