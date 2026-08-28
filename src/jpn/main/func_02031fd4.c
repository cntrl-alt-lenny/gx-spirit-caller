extern void *func_02031fa8(void *a, int b);
extern void func_02032294(void *a);
extern void func_02094500(void *dst, int val, int len);

void *func_02031fd4(void *a0, int a1) {
    void *r = func_02031fa8(a0, a1);

    if (r == 0) {
        func_02032294(a0);
        r = func_02031fa8(a0, a1);
        if (r == 0) {
            goto ret;
        }
    }
    func_02094500(r, 0, a1);
ret:
    return r;
}
