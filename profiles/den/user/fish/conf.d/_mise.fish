# should be named _mise.fish so it can be loaded first
# before other fish files in conf.d

# it's recommended to use "mise en" instead

if command -q -v mise >/dev/null
    mise activate fish --shims | source
end
