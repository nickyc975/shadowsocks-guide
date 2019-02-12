#! /bin/sh

echo "Installing shadowsocks-libev..."
apt install shadowsocks-libev

echo "Configuring..."
echo -n "Input your server ip address: "
read server
echo -n "Input your server port: "
read server_port
echo -n "Input your password: "
read password

echo "{
    \"server\":\"$server\",
    \"server_port\":$server_port,
    \"local_port\":1080,
    \"password\":\"$password\",
    \"timeout\":60,
    \"method\":\"chacha20-ietf-poly1305\"
}" > /etc/shadowsocks-libev/config.json

echo "Starting service..."
service shadowsocks-libev restart
