#!/usr/bin/make -f
SHELL=/bin/sh

DESTDIR?=/usr/local
prefix?=${DESTDIR}
EXEC_FILES=\
	bin/bee

all:
	@echo "usage: make install"
	@echo "       make uninstall"

.PHONY: install
install:
	docker-compose build
	install -d -m 0755 $(prefix)/bin
	install -m 0755 $(EXEC_FILES) $(prefix)/bin

.PHONY: uninstall
uninstall:
	docker inspect --type=image beegodocker_beego &> /dev/null && docker rmi beegodocker_beego || true
	test -d $(prefix)/bin && \
	cd $(prefix) && \
	rm -f $(EXEC_FILES)
