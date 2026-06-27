/* CAMPAIGN-PREP candidate for func_0220b9ac (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: w2.kind :6 bitfield; w explicit (w<<a)>>b shifts; ordered if-chain matches branch tree
 *   risk:       permuter-class: hand-written branch order (cmp/cmpne, bhi, movs-bne/beq) is scheduling-sensitive; mwcc may re-order or merge the movs flag-tests vs separate cmp. w2 reloaded once mid-chain (matches ldr).
 *   confidence: med
 */
/* func_ov002_0220b9ac (ov002, class D, MED) — batch p_0027.
 * Pure bitfield-test guard chain, no calls. kind in {0x16,0x1b}; then 6 ordered
 * tests on the +0x14 packed word; return 1 only if all pass and bits19-22==0xe. */
typedef unsigned short u16;
typedef unsigned int u32;

struct Self0220b9ac {
    u16 f0;
    struct { u16 b0:1; u16 f1:5; u16 kind:6; u16 f12:2; u16 _t:2; } w2; /* +0x2 */
    unsigned char _pad4[0x10];
    u32 w;                                                            /* +0x14 packed */
};

int func_ov002_0220b9ac(struct Self0220b9ac *self) {
    u32 w;
    if (self->w2.kind != 0x16 && self->w2.kind != 0x1b) return 0;
    w = self->w;
    if (((w << 22) >> 31) != (u32)self->w2.b0) return 0;          /* w.b9 vs w2.b0 */
    if (((w << 18) >> 28) > 4) return 0;                          /* bits10-13 */
    if (((w << 8) >> 31) != 0) return 0;                         /* w.b23 must be 0 */
    if (((w << 14) >> 31) == 0) return 0;                        /* w.b17 must be set */
    if (((w << 16) >> 31) == 0) return 0;                        /* w.b15 must be set */
    if (((w << 9) >> 28) == 0xe) return 1;                       /* bits19-22 == 14 */
    return 0;
}
