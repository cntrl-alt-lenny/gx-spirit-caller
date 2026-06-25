/* CAMPAIGN-PREP candidate for func_02081f5c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u16 masks <<3, bit-packed index math (0x1ffff/0x40000) preserved, OR-set flags
 *   risk:       struct-guessed: field offsets/widths (base/cnt/off/flag) inferred; confirm against real struct. Also (cnt<<3) guard may emit cmp#0 not movs-shift unless kept as the shifted value.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02081f5c (main, class D) - p_0033.
 * UNVERIFIED build-free draft: drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: u16 fields masked &0xffff then <<3; magic index math (&0x1ffff/&0x40000) preserved; OR-set flag bits
 */
/* func_02081f5c: two parallel OAM/affine upload blocks. Each guarded by a
 * non-zero (count<<3); builds shifted base addresses and bit-packed indices
 * for func_020901cc, then OR-sets a 'dirty' flag. */

extern void func_0209015c(void);
extern void func_020901cc(void *dst, int a, int b);
extern void func_02090330(void);

struct Obj {
    /* +0x00 */ char pad0[8];
    /* +0x08 */ unsigned int base0;
    /* +0x0c */ unsigned short cnt0;
    /* +0x0e */ unsigned short pad0e;
    /* +0x10 */ unsigned short flag0;
    /* +0x12 */ unsigned short pad12;
    /* +0x14 */ int off0;
    /* +0x18 */ unsigned int base1;
    /* +0x1c */ unsigned short cnt1;
    /* +0x1e */ unsigned short pad1e;
    /* +0x20 */ unsigned short flag1;
    /* +0x22 */ unsigned short pad22;
    /* +0x24 */ int off1;
    /* +0x28 */ int off1b;
};

void func_02081f5c(struct Obj *s, int doInit) {
    if (doInit)
        func_02090330();

    if (s->cnt0 << 3) {
        unsigned int a = s->base0 & 0xffff;
        func_020901cc((char *)s + s->off0, a << 3, s->cnt0 << 3);
        s->flag0 |= 1;
    }

    if (s->cnt1 << 3) {
        unsigned int b = s->base1 & 0xffff;
        int b8 = b << 3;
        int n8 = s->cnt1 << 3;
        func_020901cc((char *)s + s->off1, b8, n8);
        func_020901cc((char *)s + s->off1b,
                      ((b8 & 0x1ffff) >> 1) + 0x20000 + ((b8 & 0x40000) >> 2),
                      n8 >> 1);
        s->flag1 |= 1;
    }

    if (doInit)
        func_0209015c();
}
