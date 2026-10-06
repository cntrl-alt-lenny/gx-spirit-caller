typedef struct {
    char _pad0[0x108];
    int x108;
    char _pad10c[0xcc];
    int x1d8;
} Conn;

extern int func_0205ffc0(int *p, int b);
extern int func_02056b38(Conn **pp, int a1, int a2, int a3);
extern char data_020ffc10[];
extern char data_020ffc64[];

int func_0205538c(Conn **pp, int a1, int a2) {
    Conn *c;

    if (pp == 0 || (c = *pp) == 0) {
        return 2;
    }
    if (c->x108 != 0) {
        return 0;
    }
    if (c->x1d8 == 4) {
        func_0205ffc0((int *)pp, (int)data_020ffc10);
        return 2;
    }
    if (a2 == 0) {
        func_0205ffc0((int *)pp, (int)data_020ffc64);
        return 2;
    }
    return func_02056b38(pp, a1, 1, a2);
}
