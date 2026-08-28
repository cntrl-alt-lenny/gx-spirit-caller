extern int func_020540cc(void *p);
extern void *func_0205405c(void *p, int idx);
extern void func_02053de4(void *p, int idx);
extern void func_02054454(void *p, void *out);

void func_0206471c(void *self, int b, int c, int d) {
    void *inner;
    int n, i;

    if (*(int *)((char *)self + 0x14) != 0) {
        return;
    }
    if (*(int *)((char *)self + 0x24) != 0) {
        return;
    }
    if (*(int *)((char *)self + 0xc) == 7) {
        inner = *(void **)((char *)self + 0x8);
        n = func_020540cc(*(void **)((char *)inner + 0x10));
        for (i = 0; i < n; i++) {
            inner = *(void **)((char *)self + 0x8);
            if (self == *(void **)func_0205405c(*(void **)((char *)inner + 0x10), i)) {
                inner = *(void **)((char *)self + 0x8);
                func_02053de4(*(void **)((char *)inner + 0x10), i);
                return;
            }
        }
        return;
    }

    inner = *(void **)((char *)self + 0x8);
    func_02054454(*(void **)((char *)inner + 0xc), &self);
}
