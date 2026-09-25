function searxng --description "Start a SearXNG Podman container"
    # config
    set -l container searxng
    set -l image docker.io/searxng/searxng:latest
    set -l port 8888
    set -l config_volume searxng-config
    set -l cache_volume searxng-cache

    # create persistent volumes if they do not exist
    if not podman volume inspect $config_volume >/dev/null 2>&1
        podman volume create $config_volume
    end

    if not podman volume inspect $cache_volume >/dev/null 2>&1
        podman volume create $cache_volume
    end

    # start the existing container, if present
    if podman container exists $container
        set -l running (podman inspect --format '{{.State.Running}}' $container)

        if test "$running" = true
            echo "SearXNG is already running at http://localhost:$port"
        else
            podman start $container
            echo "Started SearXNG at http://localhost:$port"
        end

        return
    end

    # create and start the container
    podman run -d \
        --name $container \
        --restart=unless-stopped \
        --pull=missing \
        -p "$port:8080" \
        -v "$config_volume:/etc/searxng" \
        -v "$cache_volume:/var/cache/searxng" \
        $image

    if test $status -eq 0
        echo "Started SearXNG at http://localhost:$port"
    else
        echo "Failed to start SearXNG"
        return 1
    end
end
