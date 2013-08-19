struct timeval * dtime _((struct timeval *dt, struct timeval *t1, struct timeval *t2));
void makerunning _((Job jn));
int findproc _((pid_t pid, Job *jptr, Process *pptr));
void update_process _((Process pn, int status));
void update_job _((Job jn));
void printjob _((Job jn, int lng, int synch));
void deletefilelist _((LinkList file_list));
void deletejob _((Job jn));
void setprevjob _((void));
void addproc _((pid_t pid, char *text));
int havefiles _((void));
void waitforpid _((pid_t pid));
void waitjob _((int job, int sig));
void waitjobs _((void));
void clearjobtab _((void));
int initjob _((void));
void spawnjob _((void));
int should_report_time _((Job j));
void printhhmmss _((double secs));
void printtime _((struct timeval *real, struct timeinfo *ti, char *desc));
void dumptime _((Job jn));
void shelltime _((void));
void scanjobs _((void));
void checkjobs _((void));
