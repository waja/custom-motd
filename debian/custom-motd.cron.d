@reboot		root	run-parts --lsbsysinit /etc/custom-motd.d/ 2>/dev/null > /var/run/motd.custom
17 *    * * *   root    perl -e "sleep int(rand(300))" && run-parts --lsbsysinit /etc/custom-motd.d/ 2>/dev/null > /var/run/motd.custom
