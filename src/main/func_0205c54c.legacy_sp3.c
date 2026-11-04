typedef struct {
    char _pad0[0x10];
    int f_10;
    int f_14;
} inner_t;

typedef struct {
    char _pad0[0x8];
    inner_t *f_8;
} item_t;

typedef struct {
    int state;
    char _pad0[4];
    int fd;
    void *key;
} req_t;

typedef struct {
    char len;
    char family;
    short port;
    int addr;
} sa_t;

extern int func_0205d6bc(void *arg0, int junk, item_t **out);
extern int func_0205ffc0(void *p, char *msg);
extern int func_0205ffd4(void *arg0, int a, void *s);
extern int func_02054e8c(int a, int b, int c);
extern int func_02055250(int fd, int flag);
extern void func_0205c928(int fd);
extern int func_02054db8(int fd, sa_t *sa, int len);
extern int func_02054bfc(int fd);
extern int func_020585d4(void *arg0, int a, int b);

extern char data_02100bc8[];
extern char data_02100be4[];
extern char data_02100c0c[];
extern char data_02100c40[];

int func_0205c54c(void *arg0, req_t *req) {
    sa_t sa;
    item_t *item;
    int r;

    if (!func_0205d6bc(arg0, (int)req->key, &item)) {
        func_0205ffc0(arg0, data_02100bc8);
        return 3;
    }
    req->fd = func_02054e8c(2, 1, 0);
    if (req->fd == -1) {
        func_0205ffd4(arg0, 5, data_02100be4);
        func_020585d4(arg0, 3, 0);
        return 3;
    }
    if (!func_02055250(req->fd, 0)) {
        func_0205ffd4(arg0, 5, data_02100c0c);
        func_020585d4(arg0, 3, 0);
        return 3;
    }
    func_0205c928(req->fd);
    int *p = (int *)&sa;
    p[0] = 0;
    p[1] = 0;
    sa.family = 2;
    sa.addr = item->f_8->f_10;
    sa.port = item->f_8->f_14;
    if (func_02054db8(req->fd, &sa, 8) == -1) {
        r = func_02054bfc(req->fd);
        if (r != -6 && r != -26 && r != -76) {
            func_0205ffd4(arg0, 5, data_02100c40);
            func_020585d4(arg0, 3, 1);
            return 3;
        }
    }
    req->state = 0x67;
    return 0;
}
