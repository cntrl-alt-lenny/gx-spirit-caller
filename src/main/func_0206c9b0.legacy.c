extern int func_0206e4a4(int a0);
extern int func_0206c84c(char *a0);

int func_0206c9b0(char *a0, unsigned short port) {
    if (func_0206e4a4((int)a0) != 0) {
        return -0x1c;
    }
    int flag = 0;
    if (a0 != 0) {
        flag = (*(short *)(a0 + 0x70) & 0x1) != 0;
    }
    if (!flag) {
        return -0x27;
    }
    if (*(short *)(a0 + 0x70) & 0x2) {
        return -0x7;
    }
    *(unsigned short *)(a0 + 0x74) = port;
    if (*(signed char *)(a0 + 0x73) != 1) {
        return 0;
    }
    return func_0206c84c(a0);
}
