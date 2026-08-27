extern void *data_0219d998;
extern int func_020a662c(void *a, void *b, int c);
extern void func_02043bd8(void *a, int b, void *c);
extern int func_02043b8c(void *a, void *b, int c, void *d);
extern int func_02043b20(void);

struct Block_02044384 {
    char pad[0xfe];
    short v;
};

int func_02044334(void *self) {
    struct Block_02044384 *blocks = (struct Block_02044384 *)self;
    int i;
    void *q = data_0219d998;
    void *p = self;

    for (i = 0; i < 4; i++) {
        int val = func_020a662c((char *)self + 0x500, p, 0xfe);
        blocks[i].v = (short)val;
        do {
            func_02043bd8(q, 0x100, p);
        } while (func_02043b8c(p, q, 0x100, (char *)self + 0x400) == 0);
        p = (char *)p + 0x100;
        q = (char *)q + 0x100;
    }
    return func_02043b20() != 0;
}
