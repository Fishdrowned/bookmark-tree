1. Install dependencies
    ```bash
    # Run as root
    sudo su
    
    # Install nodejs
    VERSION=node_8.x
    DISTRO="$(lsb_release -s -c)"
    echo "deb https://deb.nodesource.com/$VERSION $DISTRO main" >> /etc/apt/sources.list.d/chris-lea-ubuntu-node_js-bionic.list
    echo "#deb-src https://deb.nodesource.com/$VERSION $DISTRO main" >> /etc/apt/sources.list.d/chris-lea-ubuntu-node_js-bionic.list
    curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
    apt update
    apt upgrade
    apt install nodejs
    
    # Install compass and coffee-script
    apt install ruby-dev
    gem update --system
    gem install compass
    npm install coffee-script -g
    ```
1. Build
    ```bash
    rake build
    ```
