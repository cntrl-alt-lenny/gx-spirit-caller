extern int func_0200ef44(void *, void *);
extern void *func_0200ed9c(void);

int func_0200efc4(void *arg0, void *arg1, int arg2, int arg3) {
    int r = func_0200ef44(arg0, arg1);
    void *p;
    if (r == 0) {
        return 0;
    }
    if (arg3 != 1) {
        return r;
    }
    p = func_0200ed9c();
    if (p != 0 && arg2 != 0) {
        *(int *)((char *)p + 0x98) = arg2;
        *(int *)((char *)p + 0x9c) = arg3;
    }
    return (int)p;
}
