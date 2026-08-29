# search text recursively
function rgf
    if not type -q rg
        echo "ripgrep is not installed"
        return 1
    end

    rg --hidden --glob '!.git' $argv
end
