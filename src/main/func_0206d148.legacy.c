extern int func_0206cb6c(void *self, int u1, int u2, int u3, int a5, int a6);
extern int func_0206d0b0(void *self, int u1, int u2, int u3, int a5, int a6);
extern void func_0206cd0c(void *self);

int func_0206d148(void *self, int u1, int u2, int u3, int a5, int a6, int flags) {
    char *p64 = *(char **)((char *)self + 0x64);
    signed char saved;
    int gate;
    int ret;

    gate = (flags & 2) && (p64 != 0);

    if (gate) {
        saved = *(signed char *)(p64 + 0xfe);
        *(signed char *)(p64 + 0xfe) = 1;
    }

    if (*(signed char *)((char *)self + 0x73) == 1) {
        ret = func_0206cb6c(self, u1, u2, u3, a5, a6);
    } else {
        ret = func_0206d0b0(self, u1, u2, u3, a5, a6);
        if (ret >= 0) {
            func_0206cd0c(self);
        }
    }

    if (gate) {
        *(signed char *)(p64 + 0xfe) = saved;
    }

    return ret;
}
