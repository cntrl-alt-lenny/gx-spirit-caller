/* func_ov002_02209e50: C-39 — if b6_11==6, return (unsigned)helper(bit0,
 * f0, 0) >= bits18-19 of f14; else 0. Body inside the `if` so the
 * b6_11!=6 path branches to the shared return 0 (orig `bne`). */
typedef unsigned short u16;
struct S9e50 { u16 f0; u16 bit0:1; u16 b1_5:5; u16 b6_11:6; u16 b12_15:4;
               char _4[0x14-4]; unsigned int lo18:18; unsigned int b18_19:2; unsigned int hi12:12; };
extern int func_ov002_022536e8(int bit0, u16 f0, int k);
int func_ov002_02209e50(struct S9e50 *self) {
    if (self->b6_11 == 6) {
        return (unsigned int)func_ov002_022536e8(self->bit0, self->f0, 0) >= self->b18_19;
    }
    return 0;
}
