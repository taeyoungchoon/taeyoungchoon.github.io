sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/sshd/sshd_config
systemctl restart sshd

systemctl enable firewalld
systemctl start firewalld
