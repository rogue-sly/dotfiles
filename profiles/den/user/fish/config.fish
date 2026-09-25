set -g fish_greeting # disable annoying greeting
# set -g fish_key_bindings fish_vi_key_bindings # vi mode

# env vars
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx GIT_PAGER delta
set -gx DOCKER_HOST unix:///run/user/(id -u)/podman/podman.sock

# paths
fish_add_path ~/.local/bin # user installed programs
fish_add_path ~/.dotnet/tools # dotnet tools

if status is-interactive
    # aliases
    alias zj=zellij
end
