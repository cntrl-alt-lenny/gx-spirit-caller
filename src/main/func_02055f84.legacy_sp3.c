typedef struct {
    char pad[0x1a4];
    struct { int a, b; } entries[6];
} Conn;
extern int func_0205ffc0(int *p, int b);
extern char data_020ffd3c[];
int func_02055f84(Conn **pp, int index, int a, int b) {
    Conn *p;
    if (pp == 0 || (p = *pp) == 0) return 2;
    if (index < 0 || index >= 6) {
        func_0205ffc0((int *)pp, (int)(data_020ffd3c + 4));
        return 2;
    }
    p->entries[index].a = a;
    p->entries[index].b = b;
    return 0;
}
