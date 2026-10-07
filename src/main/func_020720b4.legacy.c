/* func_020720b4: find the connection for (a0, a1) and dispatch on its state. */
typedef struct {
    unsigned char _pad_00[8];
    unsigned char f8;
    unsigned char _pad_09[0x28 - 9];
    int f28;
} Conn;
extern Conn *func_020724c8(void *a0, void *a1);
extern void func_02072144(void *header, void *packet, Conn *c);
extern void func_02072234(void *a, void *b, void *c, int d);

int func_020720b4(void *a0, void *a1, void *a2) {
    Conn *c = func_020724c8(a0, a1);
    if (c != 0) {
        if (c->f8 == 1) {
            func_02072144(a0, a1, c);
        } else if ((unsigned char)(c->f8 + 253) <= 1) {
            c->f28 = c->f28 - 1;
            func_02072144(a0, a1, c);
        } else {
            func_02072234(a0, a1, a2, 0);
        }
        return 1;
    }
    return 0;
}
