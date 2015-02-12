USER=$(whoami)

if [ "${USER}" == "root" ]; then
	cat /var/run/motd.custom
fi
