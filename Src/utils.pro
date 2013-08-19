void zwarnnam _((const char *cmd, const char *fmt, const char *str, int num));
void zerr _((const char *fmt, const char *str, int num));
void zerrnam _((const char *cmd, const char *fmt, const char *str, int num));
int putraw _((int c));
int putshout _((int c));
char * nicechar _((int c));
void nicefputs _((char *s, FILE *f));
size_t nicestrlen _((char *s));
char * findpwd _((char *s));
int ispwd _((char *s));
char ** slashsplit _((char *s));
char * xsymlink _((char *s));
void fprintdir _((char *s, FILE *f));
char * get_username _((void));
Nameddir finddir _((char *s));
void adduserdir _((char *s, char *t, int flags, int always));
char * getnameddir _((char *name));
int dircmp _((char *s, char *t));
void preprompt _((void));
void checkmailpath _((char **s));
void freestr _((void *a));
void gettyinfo _((struct ttyinfo *ti));
void settyinfo _((struct ttyinfo *ti));
void adjustwinsize _((void));
int movefd _((int fd));
void redup _((int x, int y));
int zclose _((int fd));
char * gettempname _((void));
int has_token _((const char *s));
void chuck _((char *str));
int tulower _((int c));
int tuupper _((int c));
void ztrncpy _((char *s, char *t, int len));
void strucpy _((char **s, char *t));
void struncpy _((char **s, char *t, int n));
int arrlen _((char **s));
int skipparens _((char inpar, char outpar, char **s));
long zstrtol _((const char *s, char **t, int base));
RLIM_T zstrtoq _((const char *s, char **t, int base));
int checkrmall _((char *s));
int getquery _((char *valid_chars));
void spscan _((HashNode hn, int scanflags));
void spckword _((char **s, int hist, int cmd, int ask));
int ztrftime _((char *buf, int bufsize, char *fmt, struct tm *tm));
char * zjoin _((char **arr, int delim));
char ** colonsplit _((char *s, int uniq));
char ** semicolonsplit _((char *s, int uniq));
int skipwsep _((char **s));
char ** spacesplit _((char *s, int allownull));
int findsep _((char **s, char *sep));
char * findword _((char **s, char *sep));
int wordcount _((char *s, char *sep, int mul));
char * sepjoin _((char **s, char *sep));
char ** sepsplit _((char *s, char *sep, int allownull));
List getshfunc _((char *nam));
void * allocnode _((int type));
void * dupstruct _((void *a));
struct node * simplifystruct _((struct node *n));
struct node * expandstruct _((struct node *n, int exp));
void * dupstruct2 _((void *a));
void freestruct _((void *a));
LinkList duplist _((LinkList l, VFunc func));
char ** duparray _((char **arr, VFunc func));
char ** list2arr _((LinkList l, VFunc func));
LinkList arr2list _((char **arr, VFunc func));
char ** mkarray _((char *s));
void feep _((void));
void freearray _((char **s));
int equalsplit _((char *s, char **t));
void simplifyright _((List l));
void inittyptab _((void));
char ** arrdup _((char **s));
char * spname _((char *oldname));
int mindist _((char *dir, char *mindistguess, char *mindistbest));
int spdist _((char *s, char *t, int thresh));
void setcbreak _((void));
void attachtty _((pid_t pgrp));
pid_t gettygrp _((void));
long getbaudrate _((struct ttyinfo *shttyinfo));
char * metafy _((char *buf, int len, int heap));
char * unmetafy _((char *s, int *len));
int metalen _((const char *s, int len));
char * unmeta _((const char *file_name));
int ztrcmp _((unsigned char const *s1, unsigned char const *s2));
int metadiffer _((char const *s, char const *r, int len));
int ztrlen _((char const *s));
int ztrsub _((char const *t, char const *s));
char * zreaddir _((DIR *dir));
int zputs _((char const *s, FILE *stream));
int nicezputs _((char const *s, FILE *stream));
size_t niceztrlen _((char const *s));
int hasspecial _((char const *s));
int quotedzputs _((char const *s, FILE *stream));
int optlookup _((char *s));
int optlookupc _((char c));
int dosetopt _((int optno, int value, int force));
char * getkeystring _((char *s, int *len, int fromwhere, int *misc));
int strpfx _((char *s, char *t));
int strsfx _((char *s, char *t));
void dputs _((char *message));