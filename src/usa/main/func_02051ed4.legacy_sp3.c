extern char *func_020522f8(void);
extern void func_0204fde0(int a, int b, int c);

void func_02051ed4(int a0, int a1) {
    char *p = func_020522f8();
    p[0x1d] = *(unsigned char *)(p + 0x1e);
    unsigned short val = *(unsigned short *)(p + 0x22);
    switch (val) {
    case 2:
    case 3:
    case 4:
        func_0204fde0(a0, val, a1);
        break;
    default:
        return;
    }
}
