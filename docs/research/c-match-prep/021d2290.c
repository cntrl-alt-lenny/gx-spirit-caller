/* CAMPAIGN-PREP candidate for func_021d2290 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D store-order: emit out[0] then out[1]; (x>>16) Q16->halfword via asr
 *   risk:       permuter-class: orig homes ALL args to stack (stmdb {r0-r3}+extra push) and round-trips via stack halfwords (strh;ldrh); direct C keeps them in regs -> arg-homing prologue + 4 stack ops diverge.
 *   confidence: low
 */
/* func_ov011_021d2290: write two asr#16 (Q16->int) halfwords into *out in
 * source order. Args are homed to stack (stmdb {r0-r3}) then read back: a@sp+c,
 * b@sp+10 after the extra push+sub. out=r0. Round-trips each through a stack
 * halfword (strh;ldrh) before the final strh to *out. Store-order: f0 then f2. */
void func_ov011_021d2290(short *out, int a, int b) {
    short t0 = (short)(a >> 16);
    short t1 = (short)(b >> 16);
    out[0] = t0;
    out[1] = t1;
}
