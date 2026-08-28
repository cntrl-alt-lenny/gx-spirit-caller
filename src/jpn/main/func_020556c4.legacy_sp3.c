extern int func_0205d648(void *a0, int a1, void *out);

int func_020556c4(void **a0, int a1, int *out) {
    void *local[2];

    if (a0 == 0 || *a0 == 0) {
        return 2;
    }
    if (*(int *)((char *)*a0 + 0x108) != 0) {
        *out = 0;
        return 0;
    }
    if (func_0205d648(a0, a1, local) != 0) {
        int *p = (int *)local[0];
        if (p[2] != 0) {
            *out = *(int *)p[2];
            goto ret0;
        }
    }
    *out = -1;
ret0:
    return 0;
}
