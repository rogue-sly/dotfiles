if status is-interactive
    # disable annoying greeting
    set -U fish_greeting

    # env vars
    set -gx ANDROID_HOME $HOME/Android/Sdk
    set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/config"
    ## editor
    set -gx EDITOR nvim
    set -gx VISUAL nvim

    # aliases
    alias zj=zellij

    # paths
    fish_add_path ~/.local/bin # user installed programs
    fish_add_path ~/.dotnet/tools # dotnet tools
end
