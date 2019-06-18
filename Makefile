OS_NAME := $(shell uname -s)
SOURCES = sop_gpattern.cpp
HVER = 16.0
INSTDIR = $(HOME)/houdini$(HVER)

ifeq ($(OS_NAME),Darwin)
	DSONAME = sop_gpattern.dylib
	OPTIMIZER = -O2
	INSTDIR = /Users/alex/Library/Preferences/houdini/$(HVER)
else
	DSONAME = sop_gpattern.so
	OPTIMIZER = -O2
endif
# OPTIMIZER = -g

include $(HFS)/toolkit/makefiles/Makefile.gnu

all:	install clean
install:	default	clean
	@if [ ! -d $(INSTDIR)/dso ]; then mkdir $(INSTDIR)/dso; fi
	@mv $(DSONAME) $(INSTDIR)/dso
clean:
	@rm *.o
