extern void *data_0219e968;
extern int func_02054140(void *p);
extern void *func_020540d0(char *s, int index);
extern void func_02065590(void *p);

void func_0206553c(void) {
    int i;

    if (data_0219e968 == 0) {
        return;
    }
    for (i = func_02054140(data_0219e968) - 1; i >= 0; i--) {
        func_02065590(func_020540d0(data_0219e968, i));
    }
}
