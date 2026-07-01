extern char data_02102c7c[];
extern void func_02001ef4(void *p, int x, int y);
extern int func_02003400(void);
extern int func_02004ef4(int a, int b, int c, int d, int e, int f, void *fn);

void func_02005298(void *a, int b, int c, int d, int e, int f) {
    unsigned int t;
    int hi;

    t = *(unsigned int *)((char *)a + 0x24);
    hi = (t << 11) >> 28;
    *(unsigned int *)((char *)a + 0x24) = t | 0x10000;
    t = (t << 7) >> 28;
    *(int *)(data_02102c7c + 0x10) = 1;
    *(int *)(data_02102c7c + 0x4) = t;
    func_02001ef4(a, 0, 0);
    func_02004ef4((int)a, b, c, d + 1, e + 1, f, func_02003400);
    *(int *)(data_02102c7c + 0x10) = 0;
    *(int *)(data_02102c7c + 0x8) = hi;
    func_02001ef4(a, 1, 1);
    func_02004ef4((int)a, b, c, d, e, f, func_02003400);
}
