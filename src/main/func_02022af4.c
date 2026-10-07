extern int func_020b3870(int a, int b);

int func_02022af4(int a, int b, int unused, int *q, int *out) {
    int d = b - a;
    out[0] = func_020b3870(q[0] * d, b);
    out[1] = func_020b3870(q[1] * d, b);
    out[2] = func_020b3870(q[2] * d, b);
    if (d & 2) {
        out[0] = -out[0];
        out[1] = -out[1];
        out[2] = -out[2];
    }
    return 1;
}
