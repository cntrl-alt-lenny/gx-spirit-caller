extern unsigned char data_0219eae4[];
extern int func_02054ca0(void *a, unsigned char *table, int mask, int zero, void *buf, int *cap);
extern int func_02054f8c(void *a);
extern void func_02066208(void *self, unsigned char *table, int idx, void *buf);

void func_020674ec(char *self) {
    unsigned char buf[8];
    int cap = 8;
    int idx;

    if (*(int *)(self + 0xc4) == 0) return;
    if (func_02054f8c(*(void **)self) == 0) return;

    do {
        idx = func_02054ca0(*(void **)self, data_0219eae4, 0xff, 0, buf, &cap);
        if (idx != -1) {
            data_0219eae4[idx] = 0;
            func_02066208(self, data_0219eae4, idx, buf);
        }
    } while (func_02054f8c(*(void **)self) != 0);
}
