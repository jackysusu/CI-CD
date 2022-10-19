mkdir -p /etc/systemd/resolved.conf.d/
cat >/etc/systemd/resolved.conf.d/99-dns.conf << EOF
[Resolve]
DNS=192.168.11.2 168.95.1.1
EOF
ln -s -f /run/systemd/resolve/resolv.conf /etc/resolv.conf
systemctl daemon-reload && systemctl restart systemd-resolved.service && systemctl status -l systemd-resolved.service --no-pager
cat /etc/resolv.conf