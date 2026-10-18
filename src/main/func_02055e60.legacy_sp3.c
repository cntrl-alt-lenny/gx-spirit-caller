typedef struct {
    char pad[0x108];
    int x108;
} Conn;
typedef struct { int words[8]; } Result;
typedef void (*ResultCb)(Conn **pp, Result *res, void *user);
extern int func_0205ffc0(int *p, int b);
extern int func_02059744(Conn **pp, char *a, char *b, char *c, char *d, char *e, char *f, int g, int h, int i, int j, ResultCb cb, void *user);
extern char data_020ffc54[];
extern char data_020ffd3c[];
int func_02055e60(Conn **pp, char *a, char *b, int c, int d, ResultCb cb, void *user) {
    Conn *p;
    if (pp == 0 || (p = *pp) == 0) return 2;
    if (a == 0 || *a == 0) return 2;
    if (b == 0 || *b == 0) return 2;
    if (cb == 0) {
        func_0205ffc0((int *)pp, (int)data_020ffc54);
        return 2;
    }
    if (p->x108 != 0) {
        Result result = {0};
        cb(pp, &result, user);
        return 0;
    }
    return func_02059744(pp, data_020ffd3c, data_020ffd3c, data_020ffd3c, data_020ffd3c, a, b, 0, c, 0, d, cb, user);
}
