extern unsigned char data_0219ebc4[];
extern int func_02054d14(void *a, unsigned char *table, int mask, int zero, void *buf, int *cap);
extern int func_02055000(void *a);
extern void func_0206627c(void *self, unsigned char *table, int idx, void *buf);

void func_02067560(char *self) {
    unsigned char buf[8];
    int cap = 8;
    int idx;

    if (*(int *)(self + 0xc4) == 0) return;
    if (func_02055000(*(void **)self) == 0) return;

    do {
        idx = func_02054d14(*(void **)self, data_0219ebc4, 0xff, 0, buf, &cap);
        if (idx != -1) {
            data_0219ebc4[idx] = 0;
            func_0206627c(self, data_0219ebc4, idx, buf);
        }
    } while (func_02055000(*(void **)self) != 0);
}
