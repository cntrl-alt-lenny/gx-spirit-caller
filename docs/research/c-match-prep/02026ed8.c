/* CAMPAIGN-PREP candidate for func_02026ed8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: set?-1:0 (mvnne/moveq); shared 1<<idx; clear computes mask then reloads word
 *   risk:       reshape-able: in clear path orig computes mvn(~(1<<idx)) BEFORE reloading word; if mwcc loads word first the ldr/mvn schedule swaps. Bind/operand-order tweak closes it.
 *   confidence: med
 */
/* func_02026ed8 (main, class D) - set/clear a single bit in the u32 word at 0x154.
 * idx<0  -> word = set ? 0xffffffff : 0   (mvnne/moveq form)
 * idx>=0 -> word = set ? (word|(1<<idx)) : (word & ~(1<<idx)). Returns 1. */
typedef unsigned int u32;

typedef struct Obj26ed8 {
    char _pad[0x154];
    u32  w;            /* 0x154 */
} Obj26ed8;

int func_02026ed8(Obj26ed8 *p, int idx, int set) {
    if (idx < 0) {
        p->w = set ? -1 : 0;
    } else if (set) {
        p->w = p->w | (1 << idx);
    } else {
        p->w = p->w & ~(1 << idx);
    }
    return 1;
}
