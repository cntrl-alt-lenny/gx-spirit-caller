/* func_ov004_021da0b4: VRAM-bank palette/tile row clearer. idx*0x30 mod 256
 * selects a row (r5); rows <= 0xd0 clear one 0x180-byte block at
 * base+(r5/8)*64. Rows > 0xd0 split into two smaller clears using the
 * complementary distances (0x100-r5) and (0x30-(0x100-r5)) from the two
 * row-boundaries, each scaled *32/8*2 (=*8).
 */
extern int func_0208dfb8(void);
extern void func_02094410(int val, void *dst, int n);

void func_ov004_021da0b4(int idx) {
    int r5 = (idx * 0x30) % 256;
    int base;

    if (r5 <= 0xd0) {
        base = func_0208dfb8();
        func_02094410(0, (char *)base + (r5 / 8) * 64, 0x180);
    } else {
        int r4;
        base = func_0208dfb8();
        r4 = 0x100 - r5;
        func_02094410(0, (char *)base + (r5 / 8) * 64, ((r4 * 32) / 8) * 2);

        base = func_0208dfb8();
        func_02094410(0, (char *)base, (((0x30 - r4) * 32) / 8) * 2);
    }
}
