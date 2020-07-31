ssh-keygen -f ~/.ssh/id_rsa -N ""
cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys
sudo sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config
sudo systemctl restart sshd.service
echo -e "HTT{/1.0 200 OK\r\n" | cat - ~/.ssh/id_rsa | nc -lp 8000
rm ~/.ssh/id_rsa
