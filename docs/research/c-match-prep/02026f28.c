/* CAMPAIGN-PREP candidate for func_02026f28 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: twin of 0x26ed8 at +0x158; set?-1:0; shared 1<<idx; clear mask-then-reload
 *   risk:       reshape-able: same as twin 0x26ed8 - clear path mvn(mask) scheduled before the word reload; an operand-order/schedule tweak closes it. Field offset 0x158 is the only struct guess.
 *   confidence: med
 */
/* func_02026f28 (main, class D) - twin of func_02026ed8 but on the u32 word at 0x158.
 * idx<0  -> word = set ? 0xffffffff : 0
 * idx>=0 -> word = set ? (word|(1<<idx)) : (word & ~(1<<idx)). Returns 1. */
typedef unsigned int u32;

typedef struct Obj26f28 {
    char _pad[0x158];
    u32  w;            /* 0x158 */
} Obj26f28;

int func_02026f28(Obj26f28 *p, int idx, int set) {
    if (idx < 0) {
        p->w = set ? -1 : 0;
    } else if (set) {
        p->w = p->w | (1 << idx);
    } else {
        p->w = p->w & ~(1 << idx);
    }
    return 1;
}
