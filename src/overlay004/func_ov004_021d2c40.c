extern char data_ov004_0220b500[];
extern char data_02104f4c[];
extern char data_ov004_022915e8[];
extern int func_0201cbd8(int a, void *b);
extern int func_0201cd1c(int a, unsigned short *b, int c);
extern int func_0201cfe0(void);
extern int func_0202c028(int a);
extern char *func_0202c0c0(int a);
extern int func_02037208(int a, int b, int c, int d);
extern int OS_SPrintf(char *out, const char *fmt, ...);
extern void func_ov004_021cfbec(int id, int flag);
extern void func_ov004_021d0168(int a);
extern void func_ov004_021d0f98(int a);
extern void func_ov004_021d1308(void);
extern void func_ov004_021d8798(void *a, const char *b, int c);
int func_ov004_021d2c40(void) {
    unsigned short buf[256];
    char text[128];
    char *b = data_ov004_0220b500;
    int i;
    unsigned int cost;
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
        *(int *)(b + 0x3c0c) = buf[1];
        *(int *)(b + 0x3c64) = 0;
        for (i = 0; i < *(int *)(b + 0x3c10); i++) {
            ((int *)b)[i + 0xf0f] = buf[i + 2];
            ((int *)b)[i + 0xf05] = ((int *)b)[i + 0xf0f];
            func_ov004_021cfbec(i + 10, ((int *)b)[i + 0xf0f]);
        }
        *(int *)(b + 0x54) = 17;
        break;
    case 14:
        *(int *)(b + 0x3c64) = buf[1];
        *(int *)(b + 0x3c70) = 1;
        func_02037208(58, -1, 0, 1);
        *(int *)(b + 0x3c80) = *(int *)(b + 0x3c64);
        *(int *)(b + 0x3c68) = *(int *)(b + 0x3c64);
        func_ov004_021d1308();
        break;
    case 15:
        if (buf[1] != 0) {
            cost = (func_0202c028(*(int *)(b + *(int *)(b + 0x3c68) * 4 + 0x3c3c)) * 7) / 10;
            func_ov004_021d0168(*(int *)(b + *(int *)(b + 0x3c68) * 4 + 0x3c3c));
            if (cost <= *(unsigned int *)(data_02104f4c + 0xa60)) {
                OS_SPrintf(text, func_0202c0c0(0x1c1), cost);
                func_ov004_021d8798(data_ov004_022915e8, text, 4);
            } else {
                OS_SPrintf(text, func_0202c0c0(0x1c2), cost);
                func_ov004_021d8798(data_ov004_022915e8, text, 2);
            }
            *(int *)(b + 0x3c78) = 1;
            func_02037208(58, -1, 0, 1);
            *(int *)(b + 0x54) = 15;
        } else {
            if (*(int *)(b + 0x54) == 15) func_ov004_021d0f98(0);
            func_02037208(66, -1, 0, 1);
        }
        break;
    case 16:
        if (func_0201cfe0() == 0) func_0201cd1c(6, buf, 2);
        func_ov004_021d0f98(1);
        break;
    }
    return 1;
}

