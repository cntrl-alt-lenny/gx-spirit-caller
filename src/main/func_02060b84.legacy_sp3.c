extern void *data_0219e518;
extern int func_02054140(void *p);
extern void *func_020540d0(char *s, int index);

int func_02060b84(int a, int b, int c) {
    int *e;
    int i;

    if (data_0219e518 == 0) {
        return -1;
    }
    for (i = 0; i < func_02054140(data_0219e518); i++) {
        e = func_020540d0(data_0219e518, i);
        if (e[0] == a && e[1] == b && e[2] == c) {
            return i;
        }
    }
    return -1;
}
