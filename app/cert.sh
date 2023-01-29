#!/bin/bash
sudo mkdir -p /etc/docker/certs.d/harbor.donghwa.dev
sudo openssl s_client -showcerts -connect harbor.donghwa.dev:4443 < /dev/null | sudo sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > harbor.donghwa.dev.crt
sudo cat harbor.donghwa.dev.crt
sudo cp harbor.donghwa.dev.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates
sudo systemctl restart docker
sudo docker info
