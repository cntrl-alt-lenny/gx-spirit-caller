extern int func_0205ffc0(int *p, int b);
extern char data_020ffd3c[];

int func_02055f84(int *a0, int a1, int a2, int a3) {
    char *inner;
    if (a0 == 0 || (inner = (char *)*a0) == 0) {
        return 2;
    }
    if (a1 < 0 || a1 >= 6) {
        func_0205ffc0(a0, (int)(data_020ffd3c + 4));
        return 2;
    }
    *(int *)(inner + a1 * 8 + 0x1a4) = a2;
    *(int *)(inner + a1 * 8 + 0x1a8) = a3;
    return 0;
}
