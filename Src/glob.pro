void glob _((LinkList list, LinkNode np));
long qgetnum _((char **s));
long qgetoctnum _((char **s));
int notstrcmp _((char **a, char **b));
void insert _((char *s));
char file_type _((mode_t filemode));
char * haswilds _((char *str));
int hasbraces _((char *str));
int xpandredir _((struct redir *fn, LinkList tab));
char * dyncat _((char *s1, char *s2));
char * tricat _((char *s1, char *s2, char *s3));
void xpandbraces _((LinkList list, LinkNode *np));
char * getparen _((char *str));
int matchpat _((char *a, char *b));
char * get_match_ret _((char *s, int b, int e, int fl));
int getmatch _((char **sp, char *pat, int fl, int n));
char * getfullpath _((char *s));
void scanner _((Complist q));
int domatch _((char *str, Comp c, int fist));
int excluded _((Comp c, char *eptr));
int doesmatch _((Comp c));
Complist parsepat _((char *str));
Comp parsereg _((char *str));
Complist parsecomplist _((void));
Comp parsecomp _((void));
Comp parsecompsw _((int pathadd));
void tokenize _((char *s));
void remnulargs _((char *s));
int qualdev _((struct stat *buf, long dv));
int qualnlink _((struct stat *buf, long ct));
int qualuid _((struct stat *buf, long uid));
int qualgid _((struct stat *buf, long gid));
int qualisdev _((struct stat *buf, long junk));
int qualisblk _((struct stat *buf, long junk));
int qualischar _((struct stat *buf, long junk));
int qualmode _((struct stat *buf, long mod));
int qualflags _((struct stat *buf, long mod));
int qualeqflags _((struct stat *buf, long mod));
int qualiscom _((struct stat *buf, long mod));
int qualsize _((struct stat *buf, long size));
int qualtime _((struct stat *buf, long days));
