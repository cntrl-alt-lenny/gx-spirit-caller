extern int func_020b3870(int a, int b);

int func_02022a80(int a, int b, int *p, int *q, int *out) {
    int d = b - a;
    out[0] = func_020b3870(p[0] * d + q[0] * a, b);
    out[1] = func_020b3870(p[1] * d + q[1] * a, b);
    out[2] = func_020b3870(p[2] * d + q[2] * a, b);
    return 1;
}
