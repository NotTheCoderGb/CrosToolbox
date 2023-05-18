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
    echo "[4] Firefox (DEB)"
    echo "[5] Firefox (Flatpak) [Requires Flatpak!]"
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
    else
        echo "Please select a valid option!"
    fi
fi
