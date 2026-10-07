extern void func_02097d0c(void);
extern void func_02097d38(void);

typedef struct {
    char pad0[0x1c];
    unsigned int flags;
    char pad1[0x28 - 0x20];
    int f28;
    int f2c;
    int f30;
    int f34;
    int f38;
    volatile int f3c;
    volatile int f40;
    int f44;
    void *volatile cb_a;
    void *cb_b;
    void *cb_c;
} Dev;

int func_020975f0(Dev *dev, int a1, int a2, int a3, int a4, int a5, void *cb_a, void *cb_b) {
    void *c1;
    void *c2;
    dev->f28 = a1;
    dev->f30 = a3;
    dev->f3c = a2;
    dev->f2c = dev->f3c;
    dev->f38 = a5;
    dev->f40 = a4;
    dev->f34 = dev->f40;
    c1 = cb_a;
    if (c1 == 0) {
        c1 = func_02097d38;
    }
    dev->cb_a = c1;
    c2 = cb_b;
    if (c2 == 0) {
        c2 = func_02097d0c;
    }
    dev->cb_b = c2;
    dev->cb_c = dev->cb_a;
    dev->f44 = 0;
    dev->flags |= 2;
    return 1;
}
