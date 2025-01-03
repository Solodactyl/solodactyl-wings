#!/bin/bash

echo "Welcome to the SoloDactyl Docker Installer!"

echo "Please select an option:"
echo "1 - Install SoloDactyl Wings "
echo "2 - Uninstall SoloDactyl Wings "
read -p "Enter your choice: " choice

if [[ $choice -eq 1 ]]; then

    echo "Setting up SoloDactyl Wings..."
    # Install Node.js and dependencies
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
    sudo apt update
    sudo apt install -y nodejs git

    # Clone SoloDactyl repository
    git clone https://github.com/Solodactyl/solodactyl-wings.git
    cd solodactyl-wings

    # Install dependencies and set up the Wings
    npm install

    echo "Wings Installation completed!"



elif [[ $choice -eq 2 ]]; then

    # Uninstall Docker
    sudo apt-get remove -y docker.io
    sudo rm -rf /var/lib/docker
    sudo rm -rf /etc/docker

    echo "Wings Uninstallation completed."
else
    echo "Invalid choice. Exiting."
fi
