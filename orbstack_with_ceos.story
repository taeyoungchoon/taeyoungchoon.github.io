###

brew install orbstack

orb create ubuntu
ssh orb

curl -sL https://containerlab.dev/setup | sudo -E bash -s "all"
curl -sL https://containerlab.dev/setup | sudo -E bash -s "setup-bash-prompt"
clab version
exit

###

ssh orb

sudo apt-get update -y
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
docker run hello-world
docker rm $(docker ps -aq)
docker rmi hello-world

mkdir ~/clab-quickstart 
cd ~/clab-quickstart
curl -LO \
https://raw.githubusercontent.com/srl-labs/containerlab/main/lab-examples/srlceos01/srlceos01.clab.yml

###

#https://github.com/titom73/eos-downloader
sudo apt-get install python3-pip -y
sudo apt-get install python3-venv -y
cd ..
python3 -m venv clab-quickstart
cd clab-quickstart
source bin/activate
pip install eos-downloader

TK=
ardl --token $TK get eos --format cEOS64 --version 4.32.0F
docker import cEOS64-lab-4.32.0F.tar.xz ceos:4.32.0F

###

#about makefile
all: help
help:
	cat makefile | grep ^[a-z]
deploy:
	sudo clab deploy srlceos01.clab.yml
inspect:
	sudo clab inspect
destroy:
	sudo clab destroy

###

#about srlceos01.clab.yml
name: srlceos01

topology:
  nodes:
    ceos1:
      kind: arista_ceos
      image: ceos:4.32.0F
    ceos2:
      kind: arista_ceos
      image: ceos:4.32.0F

  links:
    - endpoints: ["ceos1:eth1", "ceos2:eth1"]
    - endpoints: ["ceos1:eth2", "ceos2:eth2"]    

###

make deploy
make inspect

###

make destroy

sudo apt install expect

exit
orb delete ubuntu -f
brew uninstall orbstack

#FINE
