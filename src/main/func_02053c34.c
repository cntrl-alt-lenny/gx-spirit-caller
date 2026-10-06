extern void func_020a6d54(void *a0, void *a1, int a2, int a3);
extern void *func_020540d0(char *s, int index);
extern char data_020ffb00[];
extern char data_020ffb04[];

void *func_02053c34(char *vec, int (*fn)(void *, void *), void *arg) {
    int i;
    void *e;

    if (fn == 0) {
        func_020a6d54(data_020ffb00, data_020ffb04, 0, 0x121);
    }
    for (i = *(int *)vec - 1; i >= 0; i--) {
        e = func_020540d0(vec, i);
        if (fn(e, arg) == 0) {
            return e;
        }
    }
    return 0;
}
