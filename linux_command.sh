Show all users in system 

awk -F: '$3 >= 1000 && $3 < 65534 {print $1}' /etc/passwd

Show path where I am

pwd 

Show folder

ls folderName
ls -l  -show more info
ls -lS -show in size order
ls  *.html
ls > out.txt
ls -d list only directories
ls -lh show in human readable format 

Write iso on flash

sudo dd if=archlinux.iso of=/dev/sdX bs=4M status=progress oflag=sync

systemctl list-units --type=service     # all loaded services
systemctl status sshd                   # is it running, what unit file, PID, logs
systemctl cat sshd                      # print the actual unit file content
systemctl is-active sshd                # active/inactive
systemctl is-enabled sshd               # starts at boot or not

journalctl -u sshd          # all logs tagged with unit "sshd"
journalctl -u sshd -f       # live-follow that service's logs
journalctl -u sshd --since today










