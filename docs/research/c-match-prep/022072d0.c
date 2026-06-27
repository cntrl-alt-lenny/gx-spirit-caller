/* CAMPAIGN-PREP candidate for func_022072d0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D bitfield: shift-pair extracts; equality guard returns const 0/2
 *   risk:       reshape-able: const-select 0/2 ordering — asm is moveq#0/movne#2 on the bit-compare; an if-return (eq->0) matches, but a ternary could flip mov order or add a branch.
 *   confidence: med
 */
/* func_ov002_022072d0 (ov002, cls D): leaf bitfield extract + field-bit compare.
 * Same entity header as 02207250. type6=bits[11:6] of u16@+2; if !=0x16 ->0.
 * Then compare bit9(u32@+0x14) vs bit0(u16@+2); equal ->0 else ->2. The asm
 * holds v<<0x1f in a reg and applies lsr#0x1f inline in the cmp (movne r0,#2,
 * moveq r0,#0). Tiny leaf, no calls. */
struct Ent {
    char _0[2];
    unsigned short f2;          /* +0x2  */
    char _4[0x10];
    unsigned int  f14;          /* +0x14 */
};

int func_ov002_022072d0(struct Ent *c) {
    unsigned short v;
    unsigned int   w;
    v = c->f2;
    if (((v << 0x14) >> 0x1a) != 0x16)
        return 0;
    w = c->f14;
    if (((w << 0x16) >> 0x1f) == ((v << 0x1f) >> 0x1f))
        return 0;
    return 2;
}
