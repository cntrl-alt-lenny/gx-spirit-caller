typedef struct {
    char pad0[0x2c];
    unsigned char arr[0x14];
    int count;
} T_02067b8c;

void func_02067b18(T_02067b8c *p, unsigned char value) {
    if (p->count < 0x14) {
        int old = p->count;
        p->count = old + 1;
        p->arr[old] = value;
    }
}
