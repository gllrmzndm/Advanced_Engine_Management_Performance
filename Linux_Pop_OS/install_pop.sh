#!/bin/bash

# Made by Guillermo Zaandam

# Define the default playbook command (can be overridden by the user)
PLAYBOOK_COMMAND="ansible-playbook ansibleplaybook.yml --ask-become-pass"

# Define the hosts
HOSTS="localhost" # Change to 'all' for testing on other servers or modify as needed

# Update apt cache
echo "Updating apt cache..."
sudo apt update -y

# Upgrade apt packages
echo "Upgrading apt packages..."
sudo apt upgrade -y

# Install required packages
echo "Installing required packages..."
sudo apt install -y ripgrep ranger gnupg2 pass shellcheck elinks autossh surfraw surfraw-extra googler jpegoptim ffmpeg gnome-tweaks gnome-shell-extensions thunderbird software-properties-common gimp scribus krita darktable graphviz google-chrome-stable peek lollypop shotwell remmina transmission deja-dup ansible dislocker neovim gnome-books guake gpick mosh autokey-gtk aria2 simplescreenrecorder flameshot virt-manager libguestfs-tools gnome-boxes qemu qemu-kvm bridge-utils 7zip jq poppler-utils fd-find fzf zoxide imagemagick

# Install Flatpak package
echo "Installing Flatpak package..."
flatpak install -y flathub de.haeckerfelix.Fragments

# Download Ghostty .deb package
echo "Downloading Ghostty .deb package..."
curl -L -o /tmp/ghostty_0.2.0_amd64.deb "https://github.com/mkasberg/ghostty-ubuntu/releases/download/1.0.1-0-ppa1/ghostty_1.0.1-0.ppa1_amd64_22.04.deb"

# Install Ghostty
echo "Installing Ghostty..."
sudo apt install -y /tmp/ghostty_0.2.0_amd64.deb

# Download chezmoi .deb package
echo "Downloading chezmoi .deb package..."
curl -L -o /tmp/chezmoi_2.57.0_linux_amd64.deb "https://github.com/twpayne/chezmoi/releases/download/v2.57.0/chezmoi_2.57.0_linux_amd64.deb"

# Install chezmoi
echo "Installing chezmoi..."
sudo apt install -y /tmp/chezmoi_2.57.0_linux_amd64.deb

# Configure Flameshot
echo "Configuring Flameshot..."
flameshot config -f "%T_ %e-%m-%Y"

# Add user to libvirt and libvirt-qemu groups
echo "Adding user to libvirt and libvirt-qemu groups..."
sudo usermod -aG libvirt,libvirt-qemu "$(whoami)"

# Configure editor alternative (set editor to vim or preferred editor)
echo "Setting default editor to neovim..."
sudo update-alternatives --set editor /usr/bin/nvim

# Install optional gnome-shell extensions
echo "Installing GNOME Shell extensions (Optional)..."
sudo apt install -y gnome-shell-extension-weather gnome-shell-extension-gsconnect-browsers

echo "Setup completed successfully!"
