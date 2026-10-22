extern int func_0208e120(void);
extern int func_0208e1cc(void);
extern void func_0209448c(int unused0, int unused1, int unused2);
void func_ov017_021b611c(void) {
    unsigned short *a, *b;
    int i, j;
    a = (unsigned short *)(func_0208e120() + 0x3c0);
    b = (unsigned short *)(func_0208e1cc() + 0x3c0);
    for (i = 0; i < 9; i++) {
        func_0209448c(0, (int)&a[i * 0x20], 0x18);
        func_0209448c(0, (int)&b[i * 0x20], 0x18);
    }
    a = (unsigned short *)(func_0208e120() + 0xbd8);
    b = (unsigned short *)(func_0208e1cc() + 0xbd8);
    for (j = 0; j < 9; j++) {
        func_0209448c(0, (int)&a[j * 0x20], 0x28);
        func_0209448c(0, (int)&b[j * 0x20], 0x28);
    }
}
