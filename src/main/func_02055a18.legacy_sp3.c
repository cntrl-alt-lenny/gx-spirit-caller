typedef struct {
    char _pad0[0x100];
    int x100;
    char _pad1[4];
    int x108;
    char _pad2[0xcc];
    int x1d8;
} Conn;

extern int func_02056a58(Conn **pp, int key);
extern int func_0205ffc0(int *p, int b);
extern char data_020ffc10[];

int func_02055a18(Conn **pp, int key) {
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
    return func_02056a58(pp, key);
}
