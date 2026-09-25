function ff --description "find a file by name"
    set -l results

    if type -q fd
        set results (fd --hidden --exclude .git $argv)
    else
        set results (find . -iname "*$argv[1]*")
    end

    if test (count $results) -eq 0
        echo "No results found"
        return 1
    end

    if type -q fzf
        string join \n $results | fzf
    else
        string join \n $results
    end
end
