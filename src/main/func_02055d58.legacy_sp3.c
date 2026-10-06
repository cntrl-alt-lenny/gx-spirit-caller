typedef struct {
    char _pad0[0x108];
    int x108;
} Conn;

typedef struct {
    int x0;
    int x4;
    int x8;
    int xc;
} Status;

typedef void (*StatusCb)(Conn **pp, Status *st, void *user);

extern int func_0205ffc0(int *p, int b);
extern int func_0205f844(Conn **pp, int a1, int a2, int a3, int a4, int a5, int a6, int a7,
                         int a8, StatusCb cb, void *user);
extern char data_020ffc54[];

int func_02055d58(Conn **pp, int a1, int a2, int a3, int a4, int a5, int a6, int a7,
                  StatusCb cb, void *user) {
    Conn *c;

    if (pp == 0 || (c = *pp) == 0) {
        return 2;
    }
    if (cb == 0) {
        func_0205ffc0((int *)pp, (int)data_020ffc54);
        return 2;
    }
    if (c->x108 != 0) {
        Status st = {0};
        st.x8 = 0x601;
        cb(pp, &st, user);
        return 0;
    }
    return func_0205f844(pp, a1, a2, a3, a4, a5, a6, 0, a7, cb, user);
}
