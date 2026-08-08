extern char *func_0205236c(void);
extern void func_0204fe54(int a, int b, int c);

void func_02051f48(int a0, int a1) {
    char *p = func_0205236c();
    p[0x1d] = *(unsigned char *)(p + 0x1e);
    unsigned short val = *(unsigned short *)(p + 0x22);
    switch (val) {
    case 2:
    case 3:
    case 4:
        func_0204fe54(a0, val, a1);
        break;
    default:
        return;
    }
}
