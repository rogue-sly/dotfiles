# mise devshell
function ms
    set -l shell (basename (ps -o comm= -p $fish_pid))
    if test -z "$shell"
        set shell fish
    end
    mise en --shell=$shell $argv
end
