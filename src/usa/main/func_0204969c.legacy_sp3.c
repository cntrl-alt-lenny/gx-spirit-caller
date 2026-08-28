extern int func_02049734(int a0, int a1, int a2, void *buf);
extern void *func_020aace8(void *buf);
extern int func_020436d8(void *buf, void *p1, int p2, int p3);

int func_0204969c(int a0, int a1, int a2, int a3, int *a4) {
    char buf[0x100];
    int ret = func_02049734(a0, a1, a2, buf);
    int v;
    if (ret == 0) {
        *a4 = -1;
        return ret;
    }
    *a4 = func_020436d8(buf, func_020aace8(buf), 0, 0);
    if (a3 == 0) {
        goto ret_early;
    }
    v = *a4;
    if (v != -1) {
        goto work;
    }
ret_early:
    return ret;
work:
    func_020436d8(buf, func_020aace8(buf), a3, v);
    return ret;
}
