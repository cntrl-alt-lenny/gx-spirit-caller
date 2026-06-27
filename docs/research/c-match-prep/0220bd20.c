/* CAMPAIGN-PREP candidate for func_0220bd20 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: kind :6 bitfield; uninitialised arg (proven lever); cmp-tree if/else mirrors bgt/bge/blt; arg via pivot-relative subtraction
 *   risk:       permuter-class: the hand-built comparison tree (pivots 0x1765/0x198a with bgt/bge/blt/beq) is shape-fragile and mwcc likely flattens differently; also lit-base subtraction (r3-0x29) may fold to a plain constant. Uninit-arg already encoded.
 *   confidence: low
 */
/* func_ov002_0220bd20 (ov002, class D, MED) — batch p_0027.
 * if w2.kind==0x23 ret 1. else map f0 (sparse cmp-tree) -> arg, leaving arg
 * INTENTIONALLY uninitialised for unmatched f0; ret 021bb90c(w2.b0,arg)!=0. */
typedef unsigned short u16;

struct Self0220bd20 {
    u16 f0;
    struct { u16 b0:1; u16 f1:5; u16 kind:6; u16 f12:2; u16 _t:2; } w2; /* +0x2 */
};

extern int func_ov002_021bb90c(int b0, int arg);

int func_ov002_0220bd20(struct Self0220bd20 *self) {
    int arg;            /* intentionally uninitialised (matches r1 left unset) */
    int f0;
    if (self->w2.kind == 0x23) return 1;
    f0 = self->f0;
    if (f0 < 0x1765) {
        if (f0 == 0x1760) arg = 0x1765 - 0x29;
    } else if (f0 == 0x1765) {
        arg = 0x1765 - 0x29;
    } else if (f0 <= 0x198a) {
        if (f0 == 0x198a - 2) arg = 0x198a - 0xe3;
        else if (f0 == 0x198a) arg = 0x198a - 0x91;
    }
    return func_ov002_021bb90c(self->w2.b0, arg) != 0 ? 1 : 0;
}
