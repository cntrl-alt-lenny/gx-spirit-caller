/* func_ov002_02208670: C-39 — unless b6_11==0x23, require
 * helper(self,bit0)==5; return 2 (shared epilogue, inverted polarity). */
typedef unsigned short u16;
struct S02208760 { u16 f0; u16 bit0:1; u16 b1_5:5; u16 b6_11:6; u16 b12_15:4; };
extern int func_ov002_022579d0(struct S02208760 *self, int bit0);
int func_ov002_02208670(struct S02208760 *self) {
    if (self->b6_11 != 0x23) {
        if (func_ov002_022579d0(self, self->bit0) != 5) return 0;
    }
    return 2;
}
