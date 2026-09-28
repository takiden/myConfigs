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

# install_anitgravity
install_go
