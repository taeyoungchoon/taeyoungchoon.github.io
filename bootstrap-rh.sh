sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/sshd/sshd_config
systemctl restart sshd

yum install git -y

