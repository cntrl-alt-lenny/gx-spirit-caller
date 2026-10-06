typedef struct {
    char **lists;
    int count;
} Set;

extern void func_020a6d54(void *a0, void *a1, int a2, int a3);
extern void *func_02053c34(char *vec, int (*fn)(void *, void *), void *arg);
extern char data_020ffb7c[];
extern char data_020ffb80[];

void *func_02054338(Set *s, int (*fn)(void *, void *), void *arg) {
    int i;
    void *r;

    if (fn == 0) {
        func_020a6d54(data_020ffb7c, data_020ffb80, 0, 0xd3);
    }
    for (i = 0; i < s->count; i++) {
        r = func_02053c34(s->lists[i], fn, arg);
        if (r != 0) {
            return r;
        }
    }
    return 0;
}
