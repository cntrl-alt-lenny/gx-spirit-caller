/* CAMPAIGN-PREP candidate for func_02007e8c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: branch-table switch returning constants; buf[0] selector, addls pc table
 *   risk:       reshape-able: switch must lower to the `cmp #5; addls pc,pc,r0,lsl#2` jump table — case-body ORDER (3,2 swap at idx2/3) must match. If mwcc reorders bodies, add explicit ascending cases (as written) or adjust; stack size 0x50 fixed.
 *   confidence: med
 */
/* func_02007e8c: fill a 0x50 stack struct via func_020939a4, then
 * branch-table switch on stack[0] when global[0x34]==2, returning
 * remapped constants; else a 2-state check. Recipe: switch returning
 * constants => branch table. Map (asm pc-relative add r0,r0,lsl#2):
 *   case0 -> .L_cc4 -> 0
 *   case1 -> .L_ce8 -> 1
 *   case2 -> .L_c94 -> 3
 *   case3 -> .L_ca0 -> 2
 *   case4 -> .L_cac -> 4
 *   case5 -> .L_cb8 -> 5
 *   default(>5) -> .L_ce8 -> 1
 * else-branch (global!=2): stack[0]==0 ? 0 : 1. */
typedef struct {
    char _pad_00[0x34];
    int mode;      /* +0x34 */
} Glob_021040ac;

extern Glob_021040ac data_021040ac;
extern void func_020939a4(void *out);

int func_02007e8c(void) {
    unsigned char buf[0x50];
    unsigned char k;
    func_020939a4(buf);
    if (data_021040ac.mode != 2) {
        k = buf[0];
        if (k == 0) return 0;
        return 1;
    }
    k = buf[0];
    switch (k) {
    case 0: return 0;
    case 1: return 1;
    case 2: return 3;
    case 3: return 2;
    case 4: return 4;
    case 5: return 5;
    default: return 1;
    }
}
