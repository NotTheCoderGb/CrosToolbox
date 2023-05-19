#Setup Architecture
architecture=$(uname -m)

echo "Welcome To:"
echo "   _____            _______          _ _               
  / ____|          |__   __|        | | |              
 | |     _ __ ___  ___| | ___   ___ | | |__   _____  __
 | |    | '__/ _ \/ __| |/ _ \ / _ \| | '_ \ / _ \ \/ /
 | |____| | | (_) \__ | | (_) | (_) | | |_) | (_) >  < 
  \_____|_|  \___/|___|_|\___/ \___/|_|_.__/ \___/_/\_\
                                                       
                                                       "

echo "What would you like to do?"
echo "[1] Install Software"
echo "[2] Configuration"
read option

if [[ $option -eq 1 ]]; then
    echo "Software Available:"
    echo "[1] Cowsay"
    echo "[2] NodeJs + NPM"
    echo "[3] Flatpak + Gnome Software Center"
    echo "[4] Firefox (Flatpak)"
    echo "[5] Snap + Gnome Software Center"
    echo "[6] Visual Studio Code"
    echo "[7] WineHQ"
    read softwareoption

    if [[ $softwareoption -eq 1 ]]; then
        sudo apt install cowsay
    elif [[ $softwareoption -eq 2 ]]; then
        sudo apt-get install curl
        curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - && sudo apt-get install -y nodejs && sudo apt-get install -y npm
    elif [[ $softwareoption -eq 3 ]]; then
        sudo apt install flatpak
        flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        sudo apt install gnome-software-common
        sudo apt install gnome-software-plugin-flatpak
        clear
        echo "Now you have to follow the instructions given on your browser"
        echo "Now you have to follow the instructions given on your browser"
        echo "Now you have to follow the instructions given on your browser"
        sleep 5
        xdg-open https://raw.githubusercontent.com/NotTheCoderGb/CrosToolbox/main/containers.MD
    elif [[ $softwareoption -eq 4 ]]; then
        flatpak install flathub org.mozilla.firefox
    elif [[ $softwareoption -eq 5 ]]; then
        sudo apt install libsquashfuse0 squashfuse fuse
        sudo apt install snapd
        sudo snap install core
        sudo apt install gnome-software-common
        sudo apt install gnome-software-plugin-snap
    elif [[ $softwareoption -eq 6 ]]; then   
        if [ "$architecture" == "x86_64" ]; then
            curl -L "https://go.microsoft.com/fwlink/?LinkID=760868" > vscode.deb
            sudo apt install ./vscode.deb
        else
            curl -L "https://objects.githubusercontent.com/github-production-release-asset-2e65be/73808440/45e5bc00-722d-11ea-93f8-c7974bfb6275?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20230518%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230518T154020Z&X-Amz-Expires=300&X-Amz-Signature=2be29cddc1e7533d1e076f812caea5417474dc3086bf9251e9dceb5627dac3a8&X-Amz-SignedHeaders=host&actor_id=84812950&key_id=0&repo_id=73808440&response-content-disposition=attachment%3B%20filename%3Dcode-oss_1.44.0-1585531075_arm64.deb&response-content-type=application%2Foctet-stream" > vscodearm64.deb
            sudo apt install ./vscodearm64.deb
        fi
    elif [[ $softwareoption -eq 7 ]]; then
        sudo dpkg --add-architecture i386 
        sudo mkdir -pm755 /etc/apt/keyrings
        sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
        sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bullseye/winehq-bullseye.sources
        sudo apt update
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "Select WineHQ version!"
        echo "[1] Stable"
        echo "[2] Development"
        echo "[3] Staging"
        read wineversion
        if [[ $wineversion -eq 1 ]]; then
            sudo apt install --install-recommends winehq-stable
        elif [[ $wineversion -eq 2 ]]; then
            sudo apt install --install-recommends winehq-devel
        elif [[ $wineversion -eq 3 ]]; then
            sudo apt install --install-recommends winehq-staging
        else
            echo "Invalid Option! Installing Stable!"
            sleep 5
            sudo apt install --install-recommends winehq-stable
        fi
    else
        echo "Please select a valid option!"
    fi
fi
