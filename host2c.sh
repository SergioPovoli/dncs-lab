#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get install -y apt-transport-https ca-certificates curl software-properties-common --assume-yes --force-yes
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce --assume-yes --force-yes
ip link set dev eth1 up
ip add add 192.168.252.2/30 dev eth1
ip route add 192.168.248.0/21 via 192.168.252.1
sudo docker run -dit --name SRwebserver -p 8080:80 -v /home/user/website/:/usr/local/apache2/htdocs/ httpd:2.4
vi /home/user/website/paginaweb.html
#PEr sergio qua comincia il problema
'<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pagina web di Serghio e Riccardo</title>
</head>
<body>
    <h1>Hi! This is maneskin yooo!</h1>   
</body>
</html>'
:wq #comando per scrivere e uscire dal vi editor
