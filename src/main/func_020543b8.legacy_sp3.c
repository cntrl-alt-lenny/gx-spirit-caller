typedef struct {
    char **lists;
    int count;
} Set;

extern void func_020a6d54(void *a0, void *a1, int a2, int a3);
extern void func_02053ca8(char *vec, void (*fn)(void *, void *), void *arg);
extern char data_020ffb7c[];
extern char data_020ffb80[];

void func_020543b8(Set *s, void (*fn)(void *, void *), void *arg) {
    int i;

    if (fn == 0) {
        func_020a6d54(data_020ffb7c, data_020ffb80, 0, 0xb6);
    }
    for (i = 0; i < s->count; i++) {
        func_02053ca8(s->lists[i], fn, arg);
    }
}
