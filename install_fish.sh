sudo true

sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install -y fish

chsh -s /usr/bin/fish
echo /usr/bin/fish | sudo tee -a /etc/shells

