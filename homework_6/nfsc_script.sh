yum install -y nfs-utils
systemctl enable firewalld --now
systemctl status firewalld
echo "192.168.11.10:/srv/share/ /mnt nfs vers=3,proto=udp,noauto,x-systemd.automount 0 0" >> /etc/fstab
systemctl daemon-reload
systemctl restart remote-fs.target