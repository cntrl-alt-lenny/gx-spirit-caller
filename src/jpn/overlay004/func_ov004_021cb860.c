/* func_ov004_021cb860: VRAM-bank-style copy dispatcher. Splits `index`
 * into a row (index*0x30/0x100) and, when the row exceeds 0xd0, into two
 * further sub-copies covering the wrap-around remainder. */
extern int func_0208dfb8(void);
extern void func_02094410(int a, int b, int c);

void func_ov004_021cb860(int index) {
    int t = index * 0x30;
    int v = t % 0x100;
    int base;

    if (v > 0xd0)
        goto wrap;

    base = func_0208dfb8();
    func_02094410(0, base + (v / 8) * 64, 0x180);
    return;

wrap:
    {
        int w;
        base = func_0208dfb8();
        w = 0x100 - v;
        func_02094410(0, base + (v / 8) * 64, (w * 32 / 8) * 2);
        base = func_0208dfb8();
        func_02094410(0, base, ((0x30 - w) * 32 / 8) * 2);
    }
}
