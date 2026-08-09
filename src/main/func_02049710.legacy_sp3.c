extern int func_020497a8(int a0, int a1, int a2, void *buf);
extern void *func_020aaddc(void *buf);
extern int func_02043728(void *buf, void *p1, int p2, int p3);

int func_02049710(int a0, int a1, int a2, int a3, int *a4) {
    char buf[0x100];
    int ret = func_020497a8(a0, a1, a2, buf);
    int v;
    if (ret == 0) {
        *a4 = -1;
        return ret;
    }
    *a4 = func_02043728(buf, func_020aaddc(buf), 0, 0);
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
    func_02043728(buf, func_020aaddc(buf), a3, v);
    return ret;
}
