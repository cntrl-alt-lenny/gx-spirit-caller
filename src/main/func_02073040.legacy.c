extern char data_021a63d0[];
extern unsigned short data_0219eecc;
extern int func_02073fc8(int a, int b, int c);
extern int func_02073fac(unsigned short a);
extern void func_020730fc(void *a, int b, int c, int d, int e, int f);

void func_02073040(int arg0, int arg1, void *ctx) {
    void *obj = *(void **)((char *)ctx + 0x4c);
    char *p = (char *)obj + 0x22;
    unsigned short counter;
    int r1;
    int r3;
    int hi;

    *(unsigned short *)(p + 0x0) = 8;
    *(unsigned short *)(p + 0x4) = *(int *)(data_021a63d0 + 4);
    *(unsigned short *)(p + 0x2) = 0;

    counter = data_0219eecc;
    *(unsigned short *)((char *)ctx + 0xa) = counter;
    data_0219eecc = data_0219eecc + 1;
    *(unsigned short *)(p + 0x6) = counter;

    r1 = func_02073fc8((int)p, 8, 0);
    r3 = func_02073fac(func_02073fc8(arg0, arg1, r1));
    hi = r3 >> 8;
    *(unsigned short *)(p + 0x2) = hi | (r3 << 8);

    func_020730fc(p, 8, arg0, arg1, *(int *)((char *)ctx + 0x1c), 1);
}
