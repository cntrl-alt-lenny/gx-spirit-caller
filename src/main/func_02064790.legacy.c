extern int func_02054140(void *p);
extern void *func_020540d0(void *p, int idx);
extern void func_02053e58(void *p, int idx);
extern void func_020544c8(void *p, void *out);

void func_02064790(void *self, int b, int c, int d) {
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
        n = func_02054140(*(void **)((char *)inner + 0x10));
        for (i = 0; i < n; i++) {
            inner = *(void **)((char *)self + 0x8);
            if (self == *(void **)func_020540d0(*(void **)((char *)inner + 0x10), i)) {
                inner = *(void **)((char *)self + 0x8);
                func_02053e58(*(void **)((char *)inner + 0x10), i);
                return;
            }
        }
        return;
    }

    inner = *(void **)((char *)self + 0x8);
    func_020544c8(*(void **)((char *)inner + 0xc), &self);
}
