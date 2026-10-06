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
  sudo tee /etc/udev/rules.d/99-keyboard.rules > /dev/null <<'EOF'
# Allow access for VIA/Vial (Raw HID)
KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0666", TAG+="uaccess", TAG+="udev-acl"

# Allow flashing for RP2040 (RP2040 Bootloader)
SUBSYSTEMS=="usb", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="0003", TAG+="uaccess"
EOF
  if [ $? -ne 0 ]; then
    return 1
  fi

  sudo udevadm control --reload && sudo udevadm trigger
}

add_simlinks(){

  cd $HOME
  ln -s /home/takiden/myConfigs/bashrc/.bashrc .bashrc
  ln -s /home/takiden/myConfigs/git/.gitconfig .gitconfig
  ln -s /home/takiden/myConfigs/tmux/.tmux.conf .tmux.conf
  ln -s /home/takiden/myConfigs/vim/.vimrc .vimrc

  cd ~/.config && ln -s /home/takiden/nvimConfig/. nvim
}

<<<<<<< HEAD
install_nvm(){
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.8/install.sh | bash
  if [ $? -eq 0 ]; then
    source ~/.bashrc
    nvm install --lts
    echo "node: $(node --version), npm: $(npm --version)"
  else
    echo "could not install NVM"
  fi
}

install_codex(){
  curl -fsSL https://chatgpt.com/codex/install.sh | sh  
}

exit_script() {
  echo "Exiting setup."
  exit 0
}

main() {
  local selection

  while true; do
    printf '\nSetup menu\n'
    printf '%s\n' \
      '1) Install NVM and Node.js' \
      '2) Install Antigravity' \
      '3) Install Go' \
      '4) Install Neovim' \
      '5) Add keyboard rules' \
      '6) Add dotfile symlinks' \
      '7) Install tmux plugins' \
      '8) Install packages' \
      '9) Install Codex' \
      '10) install_tmux_plugins' \
      '99) Exit'

    if ! read -r -p 'Select an action [1-9]: ' selection; then
      exit_script
    fi

    case "$selection" in
      1) install_nvm ;;
      2) install_anitgravity ;;
      3) install_go ;;
      4) install_nvim "$HOME" ;;
      5) add_keyboard_rules ;;
      6) add_simlinks ;;
      7) install_tmux_plugins ;;
      8) install_packages ;;
      9) install_codex ;;
      10) install_tmux_plugins ;;
      99) exit_script ;;
      *) echo 'Invalid selection. Enter a number from 1 to 9.' ;;
    esac
  done
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  main
fi


