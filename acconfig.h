
/***** begin user configuration section *****/

/* Define this to be the location of your password file */
#define PASSWD_FILE "/etc/passwd"

/* Define this to be the name of your NIS/YP password *
 * map (if applicable)                                */
#define PASSWD_MAP "passwd.byname"

/* Define to 1 if you want user names to be cached */
#define CACHE_USERNAMES 1

/* Define to 1 if system supports job control */
#define JOB_CONTROL 1

/* Define this if you use "suspended" instead of "stopped" */
#define USE_SUSPENDED 1
 
/* The default history buffer size in lines */
#define DEFAULT_HISTSIZE 30

/* The default editor for the fc builtin */
#define DEFAULT_FCEDIT "vi"

/* The default prefix for temporary files */
#define DEFAULT_TMPPREFIX "/tmp/zsh"


/***** end of user configuration section            *****/
/***** shouldn't have to change anything below here *****/
@TOP@

/* The global file to source absolutely first whenever zsh is run; *
 * if undefined, don't source anything                             */
#undef GLOBAL_ZSHENV

/* The global file to source whenever zsh is run; *
 * if undefined, don't source anything            */
#undef GLOBAL_ZSHRC

/* The global file to source whenever zsh is run as a login shell; *
 * if undefined, don't source anything                             */
#undef GLOBAL_ZLOGIN

/* The global file to source whenever zsh is run as a login shell, *
 * before zshrc is read; if undefined, don't source anything       */
#undef GLOBAL_ZPROFILE

/* The global file to source whenever zsh was run as a login shell.  *
 * This is sourced right before exiting.  If undefined, don't source *
 * anything                                                          */
#undef GLOBAL_ZLOGOUT

/* Define to 1 if compiler incorrectly cast signed to unsigned */
#undef BROKEN_SIGNED_TO_UNSIGNED_CASTING

/* Define to 1 if compiler supports variable-length arrays */
#undef HAVE_VARIABLE_LENGTH_ARRAYS

/* Define if your system defines TIOCGWINSZ in sys/ioctl.h.  */
#undef GWINSZ_IN_SYS_IOCTL

/* Define to 1 if you have NIS */
#undef HAVE_NIS

/* Define to 1 if you have NISPLUS */
#undef HAVE_NIS_PLUS

/* Define to 1 if you have RFS superroot directory. */
#undef HAVE_SUPERROOT

/* Define to 1 if you have the /dev/fd filesystem */
#undef HAVE_DEV_FD

/* Define if sys/time.h and sys/select.h cannot be both included */
#undef TIME_H_SELECT_H_CONFLICTS

/* Define if your system's struct utmp has a member named ut_host.  */
#undef HAVE_UT_HOST

/* Define if you have the <utmpx.h> header file.  */
#undef HAVE_UTMPX_H

/* Define to be the machine type (microprocessor class or machine model) */
#undef MACHTYPE

/* Define to be the name of the operating system */
#undef OSTYPE

/* Define to 1 if ANSI function prototypes are usable.  */
#undef PROTOTYPES

/* Define to be location of utmp file.  This value is only used if UTMP_FILE, *
 * UTMPX_FILE, or _PATH_UTMP are not defined in an include file.              */
#undef UTMP_FILE_CONFIG

/* Define to be a string corresponding the vendor of the machine */
#undef VENDOR

/* Define if your system defines `struct winsize' in sys/ptem.h.  */
#undef WINSIZE_IN_PTEM

/* Define  to be location of wtmp file.  This value is only use if WTMP_FILE, *
 * WTMPX_FILE, or _PATH_WTMP are not defined in an include file.              */
#undef WTMP_FILE_CONFIG

/* Define to 1 if you want to debug zsh */
#undef DEBUG

/* Define to 1 if you want to use zsh's own memory allocation routines */
#undef ZSH_MEM

/* Define to 1 if you want to debug zsh memory allocation routines */
#undef ZSH_MEM_DEBUG

/* Define to 1 if you want to turn on warnings of memory allocation errors */
#undef ZSH_MEM_WARNING

/* Define to 1 if you want to turn on memory checking for free() */
#undef ZSH_SECURE_FREE

/* Define to 1 if you want to get debugging information on internal *
 * hash tables.  This turns on the `hashinfo' builtin.              */
#undef ZSH_HASH_DEBUG

/* Define to 1 if your termcap library has the ospeed variable */
#undef HAVE_OSPEED
/* Define to 1 if you have ospeed, but it is not defined in termcap.h */
#undef MUST_DEFINE_OSPEED

/* Define to 1 if tgetent() accepts NULL as a buffer */
#undef TGETENT_ACCEPTS_NULL

/* Define to 1 if you have a working strcoll function */
#undef HAVE_STRCOLL

/* Define to 1 if you use POSIX style signal handling */
#undef POSIX_SIGNALS

/* Define to 1 if you use BSD style signal handling (and can block signals) */
#undef BSD_SIGNALS

/* Define to 1 if you use SYS style signal handling (and can block signals) */
#undef SYSV_SIGNALS

/* Define to 1 if you have no signal blocking at all (bummer) */
#undef NO_SIGNAL_BLOCKING

/* Define to `unsigned int' if <sys/types.h> or <signal.h> doesn't define */
#undef sigset_t

/* Define to 1 if struct timezone is defined by a system header */
#undef HAVE_STRUCT_TIMEZONE

/* Define if your system's typeahead disappears from the shell editor. */
#undef CLOBBERS_TYPEAHEAD

/* Define to 1 if there is a prototype defined for brk() on your system */
#undef HAVE_BRK_PROTO

/* Define to 1 if there is a prototype defined for sbrk() on your system */
#undef HAVE_SBRK_PROTO

/* Define to 1 if there is a prototype defined for ioctl() on your system */
#undef HAVE_IOCTL_PROTO

/* Define to 1 if system has working FIFO's */
#undef HAVE_FIFOS

/* Define to 1 if /bin/sh does not interpret \ escape sequences */
#undef SH_USE_BSD_ECHO

/* Define to 1 if an underscore has to be prepended to dlsym() argument */
#undef DLSYM_NEEDS_UNDERSCORE

/* The exension used for dynamically loaded modules */
#undef DL_EXT

/* Define to 1 if you want to use dynamically loaded modules */
#undef DYNAMIC
