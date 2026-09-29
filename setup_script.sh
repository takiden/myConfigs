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
  sudo dnf install -y rust cargo ripgrep tree-sitter-cli 
}

# install_anitgravity
# install_go
install_nvim $HOME
