# find a file by name
function ff
    if type -q fd
        fd --hidden --exclude .git $argv
    else
        find . -iname "*$argv[1]*"
    end
end
