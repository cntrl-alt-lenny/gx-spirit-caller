extern int func_02008d1c(int rec, int n);
int func_ov006_021b6ad8(char *base, int sel, int n, int flag) {
    switch (sel) {
    case 0:
        if (flag != 0) {
            if (func_02008d1c(0, n) == 0) return 0;
        } else {
            if ((*(unsigned int *)(base + 0x60b4 + (n / 32) * 4) & (1 << (n % 32))) == 0) return 0;
        }
        break;
    case 1:
        if (flag != 0) {
            if (func_02008d1c(1, n) == 0) return 0;
        } else {
            if ((*(unsigned int *)(base + 0x61b4 + (n / 32) * 4) & (1 << (n % 32))) == 0) return 0;
        }
        break;
    }
    return 1;
}
