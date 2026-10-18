extern int func_0206e4a4(int param0);
extern int func_0206c84c(char *a0);
extern int data_02101e48;

int func_0206c8ac(char *a0, int a1, int a2) {
    int flag;
    signed char b;
    int flag2;
    int result;
    if (func_0206e4a4((int)a0) != 0 || (*(volatile short *)(a0 + 0x70) & 8)) {
        return -28;
    }
    flag = 0;
    if (a0 != 0) {
        flag = (*(volatile short *)(a0 + 0x70) & 1) != 0;
    }
    if (!flag) return -39;
    b = *(signed char *)(a0 + 0x73);
    flag2 = 1;
    if (b != 0) {
        if (b != 4) flag2 = 0;
    }
    if (flag2) {
        if (*(volatile short *)(a0 + 0x70) & 4) {
            return *(signed char *)(a0 + 0x72) == 1 ? -30 : 0;
        }
        if (*(volatile short *)(a0 + 0x70) & 2) {
            if (*(volatile short *)(a0 + 0x70) & 0x40) return *(int *)(a0 + 0x6c);
            return data_02101e48;
        }
        *(short *)(a0 + 0x76) = a1;
        *(int *)(a0 + 0x78) = a2;
        result = func_0206c84c(a0);
        if (*(signed char *)(a0 + 0x72) != 1) result = -26;
        return result;
    }
    *(short *)(a0 + 0x76) = a1;
    *(int *)(a0 + 0x78) = a2;
    return 0;
}

