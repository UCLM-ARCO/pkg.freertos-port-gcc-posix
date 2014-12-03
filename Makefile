# -*- mode: makefile-gmake; coding: utf-8; truncate-lines: true -*-

POSIX_PORT_URL = http://interactive.freertos.org/attachments/token/r6d5gt3998niuc4/?name=Posix_GCC_Simulator_6.0.4.zip
POSIX_PORT_DIR = Posix_GCC
FREERTOS_DIR   = FreeRTOS

all: $(POSIX_PORT_DIR)

install: all
	install -d $(DESTDIR)/usr/src/$(FREERTOS_DIR)/portable
	cp -r $(POSIX_PORT_DIR)/FreeRTOS_Posix/FreeRTOS_Kernel/portable/GCC \
	      $(DESTDIR)/usr/src/$(FREERTOS_DIR)/portable/

$(POSIX_PORT_DIR): ZIPFILE = Posix_GCC.zip
$(POSIX_PORT_DIR):
	wget -q $(POSIX_PORT_URL) -O $(ZIPFILE)
	unzip -q $(ZIPFILE)
	mv Posix_GCC_Simulator $@
	rm -fv $(ZIPFILE)

.PHONY: clean
clean:
	$(RM) -rfv $(POSIX_PORT_DIR)

