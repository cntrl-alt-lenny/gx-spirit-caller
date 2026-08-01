/* func_ov004_021cb940: VRAM-bank-style copy dispatcher. Splits `index`
 * into a row (index*0x30/0x100) and, when the row exceeds 0xd0, into two
 * further sub-copies covering the wrap-around remainder. */
extern int func_0208e0a0(void);
extern void func_02094504(int a, int b, int c);

void func_ov004_021cb940(int index) {
    int t = index * 0x30;
    int v = t % 0x100;
    int base;

    if (v > 0xd0)
        goto wrap;

    base = func_0208e0a0();
    func_02094504(0, base + (v / 8) * 64, 0x180);
    return;

wrap:
    {
        int w;
        base = func_0208e0a0();
        w = 0x100 - v;
        func_02094504(0, base + (v / 8) * 64, (w * 32 / 8) * 2);
        base = func_0208e0a0();
        func_02094504(0, base, ((0x30 - w) * 32 / 8) * 2);
    }
}
