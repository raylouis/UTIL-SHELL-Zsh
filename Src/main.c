/*
 * $Id: main.c,v 3.1.0.3 1996/12/05 03:59:45 hzoli Exp $
 *
 * main.c - the main() function
 *
 * This file is part of zsh, the Z shell.
 *
 * Copyright (c) 1992-1996 Paul Falstad
 * All rights reserved.
 *
 * Permission is hereby granted, without written agreement and without
 * license or royalty fees, to use, copy, modify, and distribute this
 * software and to distribute modified versions of this software for any
 * purpose, provided that the above copyright notice and the following
 * two paragraphs appear in all copies of this software.
 *
 * In no event shall Paul Falstad or the Zsh Development Group be liable
 * to any party for direct, indirect, special, incidental, or consequential
 * damages arising out of the use of this software and its documentation,
 * even if Paul Falstad and the Zsh Development Group have been advised of
 * the possibility of such damage.
 *
 * Paul Falstad and the Zsh Development Group specifically disclaim any
 * warranties, including, but not limited to, the implied warranties of
 * merchantability and fitness for a particular purpose.  The software
 * provided hereunder is on an "as is" basis, and Paul Falstad and the
 * Zsh Development Group have no obligation to provide maintenance,
 * support, updates, enhancements, or modifications.
 *
 */

#include "zsh.h"

extern int noexitct;

/**/
int
main(int argc, char **argv)
{
    char **t;
#ifdef __EMX__
    if(!GLOBAL_DIR){
      fprintf(stderr,"zsh:  Must define environment var ZSH_HOME\n");
      exit(1);
    }
#endif
#ifdef LC_ALL
    setlocale(LC_ALL, "");
#endif

    global_permalloc();

    for (t = argv; *t; *t = metafy(*t, -1, META_ALLOC), t++);

    if (!(zsh_name = strrchr(argv[0], '/')))
	zsh_name = argv[0];
    else
	zsh_name++;
    if (*zsh_name == '-')
	zsh_name++;

    fdtable_size = OPEN_MAX;
    fdtable = zcalloc(fdtable_size);

    emulate(zsh_name, 1);   /* initialises most options */
    opts[LOGINSHELL] = (**argv == '-');
    opts[MONITOR] = 1;   /* may be unset in init_io() */
    opts[PRIVILEGED] = (getuid() != geteuid() || getgid() != getegid());
    opts[USEZLE] = 1;   /* may be unset in init_io() */
    parseargs(argv);   /* sets INTERACTIVE, SHINSTDIN and SINGLECOMMAND */

    SHTTY = -1;
    init_io();
    setupvals();
    init_signals();
    global_heapalloc();
#ifndef DYNAMIC
    init_bltinmods();
#endif
    run_init_scripts();
    init_misc();

    for (;;) {
	do
	    loop(1);
	while (tok != ENDINPUT);
	if (!(isset(IGNOREEOF) && interact)) {
#if 0
	    if (interact)
		fputs(islogin ? "logout\n" : "exit\n", stderr);
#endif
	    zexit(lastval, 0);
	    continue;
	}
	noexitct++;
	if (noexitct >= 10) {
	    stopmsg = 1;
	    zexit(lastval, 0);
	}
	zerrnam("zsh", (!islogin) ? "use 'exit' to exit."
		: "use 'logout' to logout.", NULL, 0);
    }
}
