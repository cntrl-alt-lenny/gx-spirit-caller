extern int func_0200ef60(void *, void *);
extern void *func_0200edb8(void);

int func_0200efe0(void *arg0, void *arg1, int arg2, int arg3) {
    int r = func_0200ef60(arg0, arg1);
    void *p;
    if (r == 0) {
        return 0;
    }
    if (arg3 != 1) {
        return r;
    }
    p = func_0200edb8();
    if (p != 0 && arg2 != 0) {
        *(int *)((char *)p + 0x98) = arg2;
        *(int *)((char *)p + 0x9c) = arg3;
    }
    return (int)p;
}
