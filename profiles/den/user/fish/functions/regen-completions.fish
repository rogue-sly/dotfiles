function regen-completions --description "regenerate cached fish completions from tool binaries"
    set -l outdir $__fish_config_dir/completions
    mkdir -p "$outdir"

    # declare your tools here
    set -l tools dotbee vt
    for tool in $tools
        if command -q $tool
            $tool completion fish >"$outdir/$tool.fish"
            echo "cached: $tool.fish"
        else
            echo "skip: $tool not installed"
        end
    end

    # commands with odd completion subcommands go here
    if command -q lx
        lx util completion fish >"$outdir/lx.fish"
        echo "cached: lx.fish"
    else
        echo "skip: lx not installed"
    end
end
