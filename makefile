# Generated automatically from Makefile.in by configure.
#
# $Id: Makefile.in,v 3.1.0.3 1996/12/21 01:48:59 hzoli Exp $
#
# Makefile for top level of zsh distribution
#
# Copyright (c) 1996 Richard Coleman
# All rights reserved.
#
# Permission is hereby granted, without written agreement and without
# license or royalty fees, to use, copy, modify, and distribute this
# software and to distribute modified versions of this software for any
# purpose, provided that the above copyright notice and the following
# two paragraphs appear in all copies of this software.
#
# In no event shall Richard Coleman or the Zsh Development Group be liable
# to any party for direct, indirect, special, incidental, or consequential
# damages arising out of the use of this software and its documentation,
# even if Richard Coleman and the Zsh Development Group have been advised of
# the possibility of such damage.
#
# Richard Coleman and the Zsh Development Group specifically disclaim any
# warranties, including, but not limited to, the implied warranties of
# merchantability and fitness for a particular purpose.  The software
# provided hereunder is on an "as is" basis, and Richard Coleman and the
# Zsh Development Group have no obligation to provide maintenance,
# support, updates, enhancements, or modifications.
#

# zsh version
VERSION = 3.1.0

# SHELL = /bin/sh


srcdir = .

# ========== USER CONFIGURATION SECTION ==========
#
# If `make' is executed in the directory containing this Makefile,
# any changes made in this section will override the values of
# these parameters in makefiles in any of the subdirectories.

prefix      = e:
exec_prefix = ${prefix}
bindir      = ${exec_prefix}/bin
libdir      = ${exec_prefix}/lib
infodir     = ${prefix}/info
mandir      = ${prefix}/man
manext      = 1

CC       = gcc
CPPFLAGS = 
DEFS     = -DHAVE_CONFIG_H
CFLAGS   =  -Wall -Wno-implicit -Wmissing-prototypes -Zbsd-signals -s
LDFLAGS  = 
LIBS     =  -ltermcap

# ========== YOU SHOULDN'T HAVE TO CHANGE ANYTHING BELOW HERE ==========

INSTALL         = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA    = ${INSTALL} -m 644

.SUFFIXES:

# flags passed to recursive makes in subdirectories
MAKEDEFS = CC='$(CC)' CPPFLAGS='$(CPPFLAGS)' DEFS='$(DEFS)' -j2\
CFLAGS='$(CFLAGS)' LDFLAGS='$(LDFLAGS)' LIBS='$(LIBS)' \
prefix='$(prefix)' exec_prefix='$(exec_prefix)' bindir='$(bindir)' \
libdir='$(libdir)' infodir='$(infodir)' mandir='$(mandir)' manext='$(manext)'

# subdirectories in distribution
SUBDIRS = Src Doc Etc Functions StartupFiles Misc Util

# all files in this directory included in the distribution
DIST = README INSTALL META-FAQ ChangeLog configure.in Makefile.in aclocal.m4 \
config.guess config.sub acconfig.h config.h.in install-sh stamp-h.in \
mkinstalldirs configure

# ========== DEPENDENCIES FOR BUILDING AND INSTALLING ==========

# default target
all: config.h Makefile $(SUBDIRS)

$(SUBDIRS): FORCE
	cd $@ && $(MAKE) $(MAKEDEFS)

FORCE:

# install everything
install: install.bin install.modules install.man install.info

# install/uninstall just the binary
install.bin uninstall.bin:
	cd Src && $(MAKE) $(MAKEDEFS) $@

# install/uninstall just the modules
install.modules uninstall.modules:
	cd Src && $(MAKE) $(MAKEDEFS) $@

# install/uninstall just the man pages
install.man uninstall.man:
	cd Doc && $(MAKE) $(MAKEDEFS) $@

# install/uninstall just the info pages
install.info uninstall.info:
	cd Doc && $(MAKE) $(MAKEDEFS) $@

# ========== DEPENDENCIES FOR CLEANUP ==========

mostlyclean: mostlyclean-recursive mostlyclean-top
clean:       clean-recursive       clean-top
distclean:   distclean-recursive   distclean-top
realclean:   realclean-recursive   realclean-top
superclean:  superclean-recursive  superclean-top

mostlyclean-top:
	rm -f *~

clean-top: mostlyclean-top

distclean-top: clean-top
	rm -f Makefile config.h config.status config.log config.cache stamp-h distname rcsdistname

realclean-top: distclean-top

superclean-top: realclean-top
	cd $(srcdir) && rm -f config.h.in stamp-h.in configure *~

mostlyclean-recursive clean-recursive distclean-recursive realclean-recursive superclean-recursive:
	for subdir in $(SUBDIRS); do \
	  target=`echo $@ | sed s/-recursive//`; \
	  (cd $$subdir && $(MAKE) $(MAKEDEFS) $$target) || exit 1; \
	done

# ========== DEPENDENCIES FOR MAINTENANCE ==========

Makefile: Makefile.in config.status
	CONFIG_FILES=$@ CONFIG_HEADERS= ./config.status

config.status: configure Src/version.h
	./config.status --recheck

configure: configure.in aclocal.m4
	cd $(srcdir) && autoconf

config.h: stamp-h
stamp-h: config.h.in config.status
	CONFIG_FILES= CONFIG_HEADERS=config.h ./config.status

config.h.in: stamp-h.in
stamp-h.in: configure.in acconfig.h aclocal.m4
	cd $(srcdir) && autoheader
	echo > $@

# create tag files for vi and emacs
tags:
	cd Src && $(MAKE) $@

test:
	@echo zsh test suite not available yet

FTPDIR   = /home/ftp/pub/zsh
FTP_DIST = $(FTPDIR)/zsh-$(VERSION).tar.gz
FTP_RCS  = $(FTPDIR)/zsh-RCS.tar.gz
FTP_DIFF = $(FTPDIR)/zsh-$(VERSION).diff.gz

# build zsh distribution
dist: Src tags
	@echo "Begin building zsh distribution"
	Src/zsh -c 'cd $(srcdir) ; \
	ln -sf . zsh-$(VERSION) ; \
	tar cf - zsh-$(VERSION)/**/RCS/*,v(D:s@RCS/@@:s/,v//) | \
		gzip > $(FTP_DIST) ; \
	ln -sf $${$${:-$(FTP_DIST)}#$(FTPDIR)/} $(FTPDIR)/zsh-beta.tar.gz ; \
	rm -f zsh-$(VERSION)'
	@echo "Done building zsh distribution"

# build RCS controlled source distribution
dist-rcs: Src tags
	@echo "Begin building zsh distribution (RCS source)"
	Src/zsh -o extendedglob -c 'cd $(srcdir) ; \
	ln -sf . zsh-RCS ; \
	tar cf - zsh-RCS/**/RCS | gzip > $(FTP_RCS) ; \
	rm -f zsh-RCS'
	@echo "Done building zsh distribution (RCS source)"

# make patch against the previous release
dist-diff: Src
	@echo "Making patch against the previous release"
	Src/zsh -o extendedglob -c 'cd $(srcdir) ; \
	VERSION=$(VERSION) ; \
	pl=$${(M)VERSION%%[0-9]##} ; \
	: $${prevrel:=$${VERSION%%[0-9]##}$$((pl-1))} ; \
	(rcsdiff -kk -qc -r$prevrel -r **/RCS/(^(FAQ|tags|TAGS)),v(D:s@RCS/@@:s/,v//) ; \
	 rcsdiff -qc -r$${prevrel#2.6-}(:fs/./_/) -r Etc/FAQ) | \
		gzip > $(FTP_DIFF) ; \
	rm -f $(FTPDIR)/zsh-$${prevrel}.tar.gz'

check-rcs: $(DIST) Src
	@echo Checking if there are different working files and rcs files
	Src/zsh -c 'cd $(srcdir) ; \
	integer diffs=0 ; \
	for i in **/RCS/*,v(D:s@RCS/@@:s/,v//) ; do \
	    if [[ ! -f $$i ]] then \
		co $$i ; \
	    elif ! rcsdiff -q --brief $$i ; then \
		let diffs++ ; \
	    fi ; \
	done ; \
	if ((diffs)) then exit diffs ; fi'

md5sum:
	cd $(FTPDIR) ; md5sum *.gz > MD5SUM

$(FTPDIR)/zsh-doc.tar.gz: $(srcdir)/Doc/zsh.texi
	if test -d Doc/zsh-doc ; then \
		cd Doc ; \
		make everything ; \
		cp zsh*.html /http/htdocs/zsh-manual ; \
		mv zsh*.html zsh*.ps zsh.dvi zsh.info* zsh-doc ; \
		tar cf - zsh-doc | gzip > $@ ; \
	fi

release: check-rcs dist dist-rcs dist-diff $(FTPDIR)/zsh-doc.tar.gz md5sum
	cd $(srcdir) && cp -p META-FAQ Etc/FAQ $(FTPDIR)
	cd $(FTPDIR) && \
	sed 's/zsh-3\.1\.[0-9][0-9]*/zsh-$(VERSION)/' README > README.new && \
	mv README.new README
