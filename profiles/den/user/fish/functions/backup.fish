# create a timestamped backup
function backup
    for file in $argv
        cp -r $file "$file."(date +%Y%m%d-%H%M%S)".bak"
    end
end
