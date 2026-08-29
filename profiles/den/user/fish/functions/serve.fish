# quickly start a local HTTP server
function serve
    set -l port 8000
    if test (count $argv) -gt 0
        set port $argv[1]
    end

    if type -q python
        python -m http.server $port
    else if type -q python3
        python3 -m http.server $port
    else
        echo "Python is not installed"
        return 1
    end
end
