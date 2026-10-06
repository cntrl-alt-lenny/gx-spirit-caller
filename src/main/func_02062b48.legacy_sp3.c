extern int func_02062eec(void *a0, int mode, void *arg2, int *out);
extern int func_02062e6c(void *a0);

int func_02062b48(void *a0) {
    int local;

    if (func_02062eec(a0, 6, (void *)7, &local) == 0) {
        return 0;
    }
    if (local != 0) {
        return 1;
    }
    return func_02062e6c(a0) != 0;
}
