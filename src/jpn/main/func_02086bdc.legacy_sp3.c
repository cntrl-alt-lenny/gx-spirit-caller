extern void func_0208bd50(int a0, int a1);
extern int func_0208bdf0(void);

void func_02086bdc(int *dest, char *obj) {
    int f2c12 = *(unsigned short *)(obj + 0x2c) << 12;
    int f2e12 = *(unsigned short *)(obj + 0x2e) << 12;
    int r;

    func_0208bd50(f2e12, f2c12);

    dest[0] = *(short *)(obj + 0x22);
    dest[5] = *(short *)(obj + 0x22);

    r = func_0208bdf0();
    dest[1] = (*(short *)(obj + 0x20) * r) >> 12;

    func_0208bd50(f2c12, f2e12);

    dest[0xc] = (*(unsigned short *)(obj + 0x2c) * *(short *)(obj + 0x20)) << 4;
    dest[0xd] = ((-(int)*(unsigned short *)(obj + 0x2e)) * (*(short *)(obj + 0x22) - 0x1000)) << 4;

    r = func_0208bdf0();
    dest[4] = ((-(int)*(short *)(obj + 0x20)) * r) >> 12;
}
