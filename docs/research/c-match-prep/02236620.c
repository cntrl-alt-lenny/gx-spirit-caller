/* CAMPAIGN-PREP candidate for func_02236620 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     cmp-chain g+0x5a8; parity off=b0*0x868 index into cf178/cf16c+0x120; reload bit0; counter RMW
 *   risk:       reshape-able/struct-guessed: orig reuses the mul result `ip` as both cf178 index and to form cf16c+0x120 then RE-READS [r4+2] for the second mla — match the reload, not a single bind; subtable +0x120 offset inferred.
 *   confidence: med
 */
/* func_ov002_02236620 (ov002, class D): state switch g+0x5a8 (0x7e/0x7f/0x80),
 * parity-mla into cf178 presence table (+ cf16c subtable at +0x120), 13-bit-ish
 * coord decode, counter at g+0x5ac. cf16c/cf178/ce288 0x868 family (JPN 021b8fc8). */
typedef unsigned short u16;

struct Self02236620 {
    u16 f0;
    u16 packed2;       /* +2: bit0 = <<0x1f>>0x1f */
};

extern char data_ov002_022ce288[];   /* _LIT0 g: +0x5a8 state, +0x5ac counter */
extern char data_ov002_022cf16c[];   /* _LIT3 subtable base (+0x120) */
extern char data_ov002_022cf178[];   /* _LIT2 presence table base */
extern int  func_ov002_021ca5bc(int coord);
extern void func_ov002_021d7c1c(char *p, int z);
extern void func_ov002_021df818(int negbit, int mul);

int func_ov002_02236620(struct Self02236620 *self) {
    int g = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (g == 0x7e) {            /* .L_8e0 */
        int b0 = (self->packed2 << 31) >> 31;
        int counter = *(int *)(data_ov002_022ce288 + 0x5ac);
        func_ov002_021df818(1 - b0, counter * 0xc8);
        return 0;
    }
    if (g == 0x80) {            /* falls through to .L_844 after clearing 0x5ac */
        *(int *)(data_ov002_022ce288 + 0x5ac) = 0;
    } else if (g != 0x7f) {     /* .L_908 */
        return 0;
    }
    /* .L_844: 0x7f or 0x80 */
    {
        int b0 = (self->packed2 << 31) >> 31 & 1;
        unsigned int off = (unsigned int)b0 * 0x868;     /* ip = mul, reused as index */
        int present = *(int *)(data_ov002_022cf178 + off);
        int w, coord;
        if (present == 0) return 0x7e;
        func_ov002_021d7c1c(data_ov002_022cf16c + off + 0x120, 0);
        b0 = (self->packed2 << 31) >> 31 & 1;            /* orig re-reads [r4+2] */
        w = *(int *)(data_ov002_022cf16c + (unsigned int)b0 * 0x868 + 0x120);
        coord = ((unsigned int)(w << 2) >> 24 << 1) + ((unsigned int)(w << 18) >> 31);
        if (func_ov002_021ca5bc(coord) != 0) {
            int *c = (int *)(data_ov002_022ce288 + 0x5ac);
            *c = *c + 1;
        }
        return 0x7f;
    }
}
