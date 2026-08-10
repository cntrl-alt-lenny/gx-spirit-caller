extern int func_02054140(void *p);
extern void *func_020540d0(void *s, int index);
extern int func_020689dc(void *p);
extern int func_020689b0(void *p);

int func_0206b6fc(char *a, int b, int c) {
    int count = func_02054140(*(void **)(a + 4));
    void *item;
    int i;

    for (i = 0; i < count; i++) {
        void **elem = (void **)func_020540d0(*(void **)(a + 4), i);
        item = *elem;
        if (func_020689dc(item) == b) {
            if (func_020689b0(item) == c) {
                return i;
            }
        }
    }
    return -1;
}
