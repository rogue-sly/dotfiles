# extract common archive formats
function extract
    for file in $argv
        switch $file
            case '*.tar.gz' '*.tgz'
                tar xzf $file
            case '*.tar.bz2' '*.tbz2'
                tar xjf $file
            case '*.tar.xz' '*.txz'
                tar xJf $file
            case '*.tar'
                tar xf $file
            case '*.zip'
                unzip $file
            case '*.rar' '*.7z'
                7z x $file
            case '*'
                echo "Unsupported archive: $file"
                return 1
        end
    end
end
