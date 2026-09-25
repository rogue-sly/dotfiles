function update-everything
    if type -q dnf
        echo "Updating system (dnf)..."
        sudo dnf upgrade --refresh
    else
        echo "dnf not installed, skipping"
    end

    if type -q flatpak
        echo "Updating flatpaks..."
        flatpak update -y
    else
        echo "flatpak not installed, skipping"
    end

    if type -q app-manager
        echo "Updating appimages..."
        app-manager --update-all
    else
        echo "app-manager not installed, skipping"
    end

    if type -q mise
        echo "Updating tools (mise)..."
        mise upgrade
    else
        echo "mise not installed, skipping"
    end

    if type -q fwupdmgr
        echo "Updating firmware (fwupd)..."
        fwupdmgr refresh && fwupdmgr update
    else
        echo "fwupdmgr not installed, skipping"
    end

    if type -q rustup
        echo "Updating rust toolchains..."
        rustup update
    else
        echo "rustup not installed, skipping"
    end

end
