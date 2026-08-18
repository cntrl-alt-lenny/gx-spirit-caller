extern void *func_02031ffc(void *a, int b);
extern void func_020322e8(void *a);
extern void func_020945f4(void *dst, int val, int len);

void *func_02032028(void *a0, int a1) {
    void *r = func_02031ffc(a0, a1);

    if (r == 0) {
        func_020322e8(a0);
        r = func_02031ffc(a0, a1);
        if (r == 0) {
            goto ret;
        }
    }
    func_020945f4(r, 0, a1);
ret:
    return r;
}
