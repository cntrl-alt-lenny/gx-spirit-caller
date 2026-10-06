typedef struct {
    void *sock;
    short events;
    short revents;
} poll_0206e5a8_t;

extern int func_0206e38c(void *self);
extern void func_02091768(int count);

int func_0206e5a8(poll_0206e5a8_t *fds, unsigned int n, long long timeout) {
    int finite = timeout != -1;
    poll_0206e5a8_t *p;
    unsigned int i;
    int cnt;
    int ev;
    int re;

    for (;;) {
        cnt = 0;
        p = fds;
        for (i = 0; i < n; i++, p++) {
            ev = p->events | 0xe0;
            re = func_0206e38c(p->sock) & ev;
            p->revents = re;
            if (re != 0) {
                cnt++;
            }
        }
        if (cnt > 0) {
            break;
        }
        if (finite && timeout <= 0) {
            break;
        }
        func_02091768(1);
        timeout -= 0x20b;
    }
    return cnt;
}
