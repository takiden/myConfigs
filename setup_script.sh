#!/usr/bin/bash

install_anitgravity() {
  echo "Installing Antigravity..."
  curl -fsSL https://antigravity.google/cli/install.sh | bash
  echo "Antigravity vesion $(agy --version) had been installed"
  echo
}

install_go() {

GO_VERSION=1.27.1

echo "Installing Go"
echo "https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz"

wget https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
result=$?
if [ $result -neq 0 ]; then
  return 1
fi

echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc

echo "Installed Go version: $GO_VERSION"

rm go$GO_VERSION.linux-amd64.tar.gz

echo 
}

install_nvim() {
    local target_dir="$1"
    local url="https://github.com/neovim/neovim/releases/download/v0.12.5/nvim-linux-x86_64.tar.gz"

    mkdir -p "$target_dir" || return 1

    # -f fails on HTTP errors (e.g. 404)
    # -S shows errors even if silent
    curl -fL -o "$target_dir" "$url" || {
        echo "Error: Failed to download Neovim archive." >&2
        return 1
    }

    echo "Saved archive to: $dest_file"
}

install_packages() {
  sudo apt install -y rust cargo ripgrep tree-sitter-cli ghostty
}

install_tmux_plugins() {
  # TPM
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  # theme:
  mkdir -p ~/.config/tmux/plugins/catppuccin
  git clone -b v2.3.1 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
}

add_keyboard_rules() {
sudo touch /etc/udev/rules.d/99-keyboard.rules

sudo echo "# Allow access for VIA/Vial (Raw HID)" >> /etc/udev/rules.d/99-keyboard.rules
sudo echo 'KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0666", TAG+="uaccess", TAG+="udev-acl"' >> /etc/udev/rules.d/99-keyboard.rules
sudo echo 
sudo echo "# Allow flashing for RP2040 (RP2040 Bootloader)" >> /etc/udev/rules.d/99-keyboard.rules
sudo echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="0003", TAG+="uaccess"' >> /etc/udev/rules.d/99-keyboard.rules
sudo udevadm control --reload
sudo udevadm trigger
}

add_simlinks(){

  cd $HOME
  ln -s /home/takiden/myConfigs/bashrc/.bashrc .bashrc
  ln -s /home/takiden/myConfigs/git/.gitconfig .gitconfig
  ln -s /home/takiden/myConfigs/tmux/.tmux.conf .tmux.conf
  ln -s /home/takiden/myConfigs/vim/.vimrc .vimrc

  cd ~/.config && ln -s /home/takiden/nvimConfig/. nvim
}

# install_anitgravity
# install_go
# install_nvim $HOME
# add_keyboard_rules
# add_simlinks
# install_tmux_plugins
install_packages
