# Generated automatically from Makefile.in by configure.
#
# $Id: Makefile.in,v 3.1.0.0 1996/10/30 23:41:58 hzoli Exp $
#
# Makefile for Misc subdirectory
#
# Copyright (c) 1995 Richard Coleman
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

SHELL = /bin/sh

srcdir = .

.SUFFIXES:

# all files in this directory included in the distribution
DIST = Makefile.in c2z lete2ctl compctl-examples

# ========== DEPENDENCIES FOR BUILDING ==========

all:

# ========== DEPENDENCIES FOR CLEANUP ==========

mostlyclean:
	rm -f *~

clean: mostlyclean

distclean: clean
	rm -f Makefile

realclean: distclean

superclean: realclean

# ========== DEPENDENCIES FOR MAINTENANCE ==========

subdir = Misc

Makefile: Makefile.in ../config.status
	cd .. && CONFIG_FILES=$(subdir)/$@ CONFIG_HEADERS= ./config.status

distdir = ../`cat ../distname`/$(subdir)
dist: $(DIST)
	@echo "Copying distribution files in $(subdir)"
	for file in $(DIST); do    \
	  cp -p $$file $(distdir); \
	done

rcsdistdir = ../`cat ../rcsdistname`/$(subdir)
dist-rcs: $(DIST)
	@echo "Copying distribution files in $(subdir) (RCS source)"
	for file in $(DIST); do                 \
	  ci $$file;                            \
	  cp -p RCS/$$file,v $(rcsdistdir)/RCS; \
	  co -l $$file;                         \
	done
