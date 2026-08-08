extern void *func_020498f0(void);
extern void func_0204ead0(int a, int b, int c, int d, int *e, int f);
extern int func_0204d438(void);
extern long long func_020930b0(void);

int func_0204b850(int a0, int a1) {
    int extra;
    int flag;
    if (a1 == 13) {
        extra = *(int *)((char *)func_020498f0() + 0x20c);
        flag = 1;
    } else {
        flag = 0;
    }
    func_0204ead0(a1, a0, 0, 0, &extra, flag);
    if (func_0204d438() != 0) {
        return 0;
    }
    {
        char *h = (char *)func_020498f0();
        long long v = func_020930b0();
        *(int *)(h + 0x1e8) = (int)v;
        *(int *)(h + 0x1ec) = (int)(v >> 32);
    }
    return 1;
}
