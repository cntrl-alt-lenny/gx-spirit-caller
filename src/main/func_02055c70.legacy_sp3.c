typedef struct {
    char _pad0[0x108];
    int x108;
    char _pad10c[0xcc];
    int x1d8;
} Conn;

typedef struct {
    int words[0x81];
} Result;

typedef void (*ResultCb)(Conn **pp, Result *res, void *user);

extern int func_0205ffc0(int *p, int b);
extern int func_02059f38(Conn **pp, void *buf, int a2, int a3, ResultCb cb, void *user);
extern char data_020ffc10[];
extern char data_020ffc54[];

int func_02055c70(Conn **pp, void *buf, int a2, int a3, ResultCb cb, void *user) {
    Conn *c;

    if (pp == 0 || (c = *pp) == 0 || buf == 0) {
        return 2;
    }
    if (cb == 0) {
        func_0205ffc0((int *)pp, (int)data_020ffc54);
        return 2;
    }
    if (c->x108 != 0) {
        Result res = {0};
        cb(pp, &res, user);
        return 0;
    }
    if (c->x1d8 == 4) {
        func_0205ffc0((int *)pp, (int)data_020ffc10);
        return 2;
    }
    return func_02059f38(pp, buf, a2, a3, cb, user);
}
