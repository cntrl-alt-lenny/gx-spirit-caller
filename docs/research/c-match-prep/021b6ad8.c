/* CAMPAIGN-PREP candidate for func_021b6ad8 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed /32,%32 bit-index (sign-corrected); flag!=0 branch first; mirrored arms; bit-test
 *   risk:       permuter-class: the two arms have asymmetric epilogue shapes in the orig (arm0 bne->mov#0 vs arm1 moveq#0/popeq); a single mirrored C body won't reproduce both branch layouts — likely permuter/escape.
 *   confidence: low
 */
/* func_ov006_021b6ad8 (ov006, class D / permuter-ish): two near-identical arms
 * (sel 0 and 1). For each arm: if flag!=0, delegate to func_02008d1c(sel, idx)
 * and return whether it was nonzero. Otherwise test a bit in a per-arm bitmap:
 * word at p + (idx/32)*4 + 0x60b4 (arm0) / 0x61b4 (arm1), bit (idx%32). idx is
 * SIGNED (div/mod by 32 carry the sign-correction the asm shows). default ->1.
 *
 * The two arms have asymmetric epilogues in the orig (arm0 bne+mov#0; arm1
 * moveq#0/popeq) -- a scheduling/branch-shape coin flip. */

extern int func_02008d1c(int sel, int idx);

int func_ov006_021b6ad8(char *p, int sel, int idx, int flag) {
    if (sel == 0) {
        if (flag != 0)
            return func_02008d1c(0, idx) != 0;
        return (*(int *)(p + (idx / 32) * 4 + 0x60b4) & (1 << (idx % 32))) != 0;
    }
    if (sel == 1) {
        if (flag != 0)
            return func_02008d1c(1, idx) != 0;
        return (*(int *)(p + (idx / 32) * 4 + 0x61b4) & (1 << (idx % 32))) != 0;
    }
    return 1;
}
