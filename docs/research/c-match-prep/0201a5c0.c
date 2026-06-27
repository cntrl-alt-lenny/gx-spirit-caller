/* CAMPAIGN-PREP candidate for func_0201a5c0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl acc-first then i; orrge=if(>=) acc|=(1<<i); arg is i+1, counter i held
 *   risk:       permuter-class: orig hoists const 1 into a dedicated reg r4 (`mov r4,#1` outside loop) so `1<<i` is `r4,lsl r5`; mwcc may rematerialise the 1 inline as `mov rX,#1;lsl` each iter — a reg-alloc/hoist coin-flip a C reshape can't force.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0201a5c0 (main, class C) — UNVERIFIED build-free draft.
 * Counted loop accumulating a bitmask. r6=acc(0), r5=i(0), r4=const 1.
 *   for (i=0; i<0x1a; i++) if (func_020097d4(i+1) >= 0x50) acc |= 1u << i;
 *   return acc;
 * Decl order matches reg alloc: acc(r6) then i(r5) then the constant 1(r4).
 * orrge => write as if(>=) acc|=... ; (1<<i) uses the standalone const reg r4 shifted by r5. */
extern int func_020097d4(int);

int func_0201a5c0(void) {
    int acc = 0;
    int i;
    for (i = 0; i < 0x1a; i++) {
        if (func_020097d4(i + 1) >= 0x50)
            acc |= 1 << i;
    }
    return acc;
}
