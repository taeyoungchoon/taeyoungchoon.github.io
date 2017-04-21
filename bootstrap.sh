sed -i 's/us.arch/kr.arch/g' /etc/apt/sources.list
apt-get update -y

apt-get install -y emacs23-nox
apt-get install -y make curl git bc

curl -L http://cpanmin.us | perl - --sudo App::cpanminus
