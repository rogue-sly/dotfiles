function fourget --description "Start a 4get Podman container"
    # config
    set -l container fourget
    set -l image docker.io/luuul/4get:latest
    set -l port 8888

    # start the existing container, if present
    if podman container exists $container
        set -l running (podman inspect --format '{{.State.Running}}' $container)

        if test "$running" = true
            echo "4get is already running at http://localhost:$port"
        else
            podman start $container >/dev/null

            if test $status -eq 0
                echo "Started 4get at http://localhost:$port"
            else
                echo "Failed to start 4get"
                return 1
            end
        end

        return
    end

    # create and start the container
    podman run -d \
        --name $container \
        --restart=unless-stopped \
        --pull=missing \
        -p "$port:80" \
        -e FOURGET_PROTO=http \
        -e FOURGET_SERVER_NAME=localhost \
        $image

    if test $status -eq 0
        echo "Started 4get at http://localhost:$port"
    else
        echo "Failed to start 4get"
        return 1
    end
end
