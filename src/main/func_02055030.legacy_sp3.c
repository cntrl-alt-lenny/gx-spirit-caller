typedef struct {
    int fd;
    short events;
    short revents;
} PollFd;

extern int func_0206e5a8(PollFd *fds, int n, int timeout, int flags);

int func_02055030(int fd, int *rd, int *wr, int *ex) {
    PollFd p;
    int r;

    p.events = 0;
    p.fd = fd;
    if (rd != 0) {
        p.events |= 1;
    }
    if (wr != 0) {
        p.events |= 8;
    }
    p.revents = 0;
    r = func_0206e5a8(&p, 1, 0, 0);
    if (r < 0) {
        return -1;
    }
    if (rd != 0) {
        if (r > 0 && (p.revents & 0x41)) {
            *rd = 1;
        } else {
            *rd = 0;
        }
    }
    if (wr != 0) {
        if (r > 0 && (p.revents & 0x8)) {
            *wr = 1;
        } else {
            *wr = 0;
        }
    }
    if (ex != 0) {
        if (r > 0 && (p.revents & 0x20)) {
            *ex = 1;
        } else {
            *ex = 0;
        }
    }
    return r;
}
