sudo mkdir -p /etc/docker/certs.d/harbor.jad.local/
sudo openssl s_client -showcerts -connect harbor.jad.local:443 </dev/null 2>/dev/null|openssl x509 -outform PEM > ca.crt
sudo mv ca.crt /etc/docker/certs.d/harbor.jad.local
sudo cp /etc/docker/certs.d/harbor.jad.local/ca.crt /usr/local/share/ca-certificates/harbor.jad.local.crt
sudo update-ca-certificates