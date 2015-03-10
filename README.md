# Situation of motd in jessie and above

Is described in https://lists.debian.org/debian-devel/2014/12/msg00368.html

  - with systemd /var/run/motd.dynamic is not written cause **empty** motd.service (see also [here](http://lists.freedesktop.org/archives/systemd-devel/2012-June/005417.html))
  - pam_motd provides a facility (via a custom patch, brought over by Ubuntu) that run-parts /etc/update-motd.d, this directory needs to be created on Debian
  - pam_motd writes the run-parts output to (/var)/run/motd, but that's **not** used by **anything**, Ubuntu's pam_motd is patching this to be /run/motd.dynamic

# Related projects

  - https://github.com/nickcharlton/dynamic-motd/
