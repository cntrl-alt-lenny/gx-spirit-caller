extern int func_02073d6c(int a4);
extern int func_02073dc8(int a4);
extern int func_02073750(void);
extern int func_020735c4(int a4);
extern void func_02094688(void *dst, void *src, int n);
extern void func_02073c48(void *p1, void *p2, int a2, int a3);

extern char data_0219ee4c[];

void func_02073368(void *a0, void *a1, int a2, int a3, int a4, unsigned short a5) {
    unsigned char *base = (unsigned char *)a0;
    unsigned short swapped = (unsigned short)((a5 >> 8) | (a5 << 8));
    int r;

    *(unsigned short *)(base - 2) = swapped;

    if (func_02073d6c(a4) != 0) {
        goto cc0;
    }

    {
        int eb0 = func_02073dc8(a4);
        if (eb0 == 0) {
            return;
        }
        r = func_02073750();
        if (r == 0) {
            r = func_020735c4(eb0);
        }
        if (r == 0) {
            return;
        }
        func_02094688((void *)r, base - 0xe, 6);
        goto cf0;
    }

cc0:
    base[-14] = 1;
    base[-13] = 0;
    base[-12] = 0x5e;
    base[-11] = (unsigned char)(((unsigned int)a4 >> 16) & 0x7f);
    base[-10] = (unsigned char)((unsigned int)a4 >> 8);
    base[-9] = (unsigned char)a4;

cf0:
    func_02094688(data_0219ee4c, base - 8, 6);
    func_02073c48(base - 0xe, (char *)a1 + 0xe, a2, a3);
}
