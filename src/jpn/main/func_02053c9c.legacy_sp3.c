extern int func_0205405c(int *p, int a3);
extern int func_02053ac4(int a1, int v, int diff, int f8, int a2, int *pflag);
extern int func_02053b30(int a1, int v, int diff, int f8, int a2);
extern int func_020b377c(int a0, int f8);

int func_02053c9c(int *p, int a1, int a2, int a3, int a5) {
    int flag = 1;
    int deref;
    int result;

    if (p == 0) {
        goto fail;
    }
    deref = *p;
    if (deref != 0) {
        goto body;
    }
fail:
    return -1;
body:
    if (a5 != 0) {
        int v = func_0205405c(p, a3);
        result = func_02053ac4(a1, v, deref - a3, p[2], a2, &flag);
    } else {
        int v = func_0205405c(p, a3);
        result = func_02053b30(a1, v, deref - a3, p[2], a2);
    }
    if (result == 0) {
        goto fail2;
    }
    if (flag == 0) {
        goto fail2;
    }
    return func_020b377c(result - p[5], p[2]);
fail2:
    return -1;
}
