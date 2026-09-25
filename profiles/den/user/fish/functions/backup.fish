function backup --description "create a timestamped backup"
    for file in $argv
        cp -r $file "$file."(date +%Y%m%d-%H%M%S)".bak"
    end
end
