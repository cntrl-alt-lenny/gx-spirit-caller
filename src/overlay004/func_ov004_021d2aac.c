extern char data_ov004_0220b500[];
extern int func_0201cbd8(int a, void *b);
extern int func_0201cd1c(int a, void *b, int c);
extern int func_0201cfe0(void);
extern int func_02037208(int a, int b, int c, int d);
extern void func_ov004_021cfbec(int id, int flag);
extern void func_ov004_021d1118(int a);
int func_ov004_021d2aac(void) {
    unsigned short buf[256];
    char *b = data_ov004_0220b500;
    int i;
    if (func_0201cbd8(6, buf) == 0) return 0;
    switch (buf[0]) {
    case 10:
        *(int *)(b + 0x48) = 1;
        *(int *)(b + 0x54) = 4;
        break;
    case 11:
        *(int *)(b + 0x3c7c) = 1;
        *(int *)(b + 0x3c10) = 0;
        *(int *)(b + 0x3c6c) = 0;
        *(int *)(b + 0x3c70) = 0;
        break;
    case 12:
        *(int *)(b + 0x3c7c) = 0;
        *(int *)(b + 0x3c10) = buf[1];
        *(int *)(b + 0x3c68) = 0;
        for (i = 0; i < *(int *)(b + 0x3c10); i++) {
            ((int *)b)[i + 0xf0f] = buf[i + 2];
            func_ov004_021cfbec(i + 10, ((int *)b)[i + 0xf0f]);
        }
        break;
    case 14:
        *(int *)(b + 0x3c64) = buf[1];
        *(int *)(b + 0x3c70) = 1;
        func_02037208(58, -1, 0, 1);
        break;
    case 15:
        if (buf[1] != 0) {
            *(int *)(b + 0x3c78) = 1;
            func_02037208(58, -1, 0, 1);
        } else {
            if (*(int *)(b + 0x54) == 15) func_ov004_021d1118(0);
            func_02037208(66, -1, 0, 1);
        }
        break;
    case 16:
        if (func_0201cfe0() == 0) func_0201cd1c(6, buf, 2);
        func_ov004_021d1118(1);
        break;
    }
    return 1;
}





