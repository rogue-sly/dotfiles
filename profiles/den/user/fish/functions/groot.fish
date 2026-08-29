function groot
    set -l root (git rev-parse --show-toplevel 2>/dev/null)
    if test $status -eq 0
        cd $root
    else
        echo "Not inside a Git repository"
        return 1
    end
end
