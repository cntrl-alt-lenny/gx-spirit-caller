typedef struct {
    char _pad0[0x108];
    int x108;
    char _pad10c[0xcc];
    int x1d8;
} Conn;

extern int func_0205ffc0(int *p, int b);
extern int func_0205a18c(Conn **pp, int command, char *value);
extern char data_020ffc10[];

int func_02055c04(Conn **pp, int command, char *value) {
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
    return func_0205a18c(pp, command, value);
}
