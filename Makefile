# Makefile
PACKAGE="custom-motd"

all: test install

test:
	# Checking for syntax errors
	set -e; for SCRIPT in scripts/*; \
	do \
		sh -n $$SCRIPT; \
	done

	# Checking for bashisms (currently not failing, but only listing)
	if [ -x /usr/bin/checkbashisms ]; \
	then \
		checkbashisms scripts/* || true; \
	else \
		echo "WARNING: skipping bashism test - you need to install devscripts."; \
	fi

install:
	# Installing scripts
	mkdir -p "$(DESTDIR)/usr/share/$(PACKAGE)/"
	cp -r scripts "$(DESTDIR)/usr/share/$(PACKAGE)/"
	chmod -R +x "$(DESTDIR)/usr/share/$(PACKAGE)/scripts"

uninstall:
	# Uninstalling scripts
	rm -rf "$(DESTDIR)/usr/share/$(PACKAGE)"

reinstall: uninstall install
