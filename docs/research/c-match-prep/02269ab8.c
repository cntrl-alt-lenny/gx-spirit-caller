/* CAMPAIGN-PREP candidate for func_02269ab8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bind flags word in one local; explicit (f<<k)>>31 per bit; reload+bic on write
 *   risk:       reshape-able: mwcc may fold (f<<19)>>31 into an AND/tst, or reload the word per-test instead of holding f. Fix: switch to 1-bit bitfield member, or force the bind.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02269ab8 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches.
 *   recipe: D bit-test chain. Hold flags word in ONE local (bound across all 4 tests,
 *           matching r1 reuse); extract each bit with explicit (f<<k)>>31 to force
 *           lsl#k;lsr#31 (a plain & would emit tst/and). Each set-bit path re-reads the
 *           global, clears the bit (bic = &= ~mask), returns 1. Fall-through returns 0.
 *   risk:   reshape-able: if mwcc folds (f<<19)>>31 to an AND (tst) instead of lsl;lsr,
 *           OR reloads the word per-test instead of binding f once. Fix = swap to a
 *           1-bit bitfield member at the position, or vice-versa; and keep `f` bound.
 *   bit map: lsl#0x13->bit12 (0x1000), lsl#0x15->bit10 (0x400), lsl#0x1b->bit4 (0x10),
 *            lsl#0x11->bit14 (0x4000).
 */
extern int func_ov002_02269758(void);
extern int func_ov002_02269874(void);
extern int func_ov002_02246a50(void);
extern int func_ov002_022699a4(void);

typedef struct {
    char         _pad_0x300[0x300];
    unsigned int flags;
} ov002_state_t;

extern ov002_state_t data_ov002_022cd968;

int func_ov002_02269ab8(void) {
    unsigned int f = data_ov002_022cd968.flags;
    if ((f << 0x13) >> 0x1f) {
        if (func_ov002_02269758())
            data_ov002_022cd968.flags &= ~0x1000u;
        return 1;
    }
    if ((f << 0x15) >> 0x1f) {
        if (func_ov002_02269874())
            data_ov002_022cd968.flags &= ~0x400u;
        return 1;
    }
    if ((f << 0x1b) >> 0x1f) {
        if (func_ov002_02246a50())
            data_ov002_022cd968.flags &= ~0x10u;
        return 1;
    }
    if ((f << 0x11) >> 0x1f) {
        if (func_ov002_022699a4())
            data_ov002_022cd968.flags &= ~0x4000u;
        return 1;
    }
    return 0;
}
