int addbuiltin _((char *nam, int flags, HandlerFunc hfunc, int minargs, int maxargs, char *optstr));
int deletebuiltin _((char *nam));
void * try_load_module _((char const *name));
void * do_load_module _((char const *name));
LinkNode find_module _((const char *name));
int init_module _((Module m));
Module load_module _((char const *name));
int cleanup_module _((Module m));
void add_dep _((char *name, char *from));
int bin_zmodload _((char *nam, char **args, char *ops, int func));
int load_zle_syms _((void *handle));
void noop_function _((void));
void noop_function_int _((int nothing));
unsigned char * load_zleread _((char *lp, char *rp));
