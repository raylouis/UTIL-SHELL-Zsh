int zzlex _((void));
long getcvar _((LV s));
long setvar _((LV s, long v));
int notzero _((long a));
void op _((int what));
void bop _((int tk));
long mathevall _((char *s, int prek, char **ep));
long matheval _((char *s));
long mathevalarg _((char *s, char **ss));
void mathparse _((int pc));
