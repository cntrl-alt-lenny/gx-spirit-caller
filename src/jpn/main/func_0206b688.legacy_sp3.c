extern int func_020540cc(void *p);
extern void *func_0205405c(void *s, int index);
extern int func_02068968(void *p);
extern int func_0206893c(void *p);

int func_0206b688(char *a, int b, int c) {
    int count = func_020540cc(*(void **)(a + 4));
    void *item;
    int i;

    for (i = 0; i < count; i++) {
        void **elem = (void **)func_0205405c(*(void **)(a + 4), i);
        item = *elem;
        if (func_02068968(item) == b) {
            if (func_0206893c(item) == c) {
                return i;
            }
        }
    }
    return -1;
}
