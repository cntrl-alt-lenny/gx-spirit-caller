/* CAMPAIGN-PREP candidate for func_021ad284 (ov005, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order: ret(r4)/state first; if/else-if chain matches cmp;beq (NOT switch jump-table); reload counter each block (orig re-ldr's [r5,#0xc]); reset via the 0-reg
 *   risk:       Orig reloads o->counter after each func_0208c884 (separate ldr) rather than caching; if mwcc keeps counter in a callee-saved reg across the calls, ldr count diverges (reshape-able: re-read o->counter each use, already written that way). counter offset guessed (struct-guessed).
 *   confidence: med
 */
/* ov005 021ad284 — class D: 3-state machine (cmp/beq chain, not jump table),
 * MMIO writes via func_0208c884(reg,val), clean stores, branch-tail to .L_c8.
 * ret accumulator r4 declared/zeroed up front (mov r4,#0 before the switch). */

extern int func_0208c884(unsigned int reg, int val);
extern int func_ov005_021ae5a4(void);

struct Sm021ad284 {
    int state;        /* 0x0 */
    int pad[2];       /* 0x4, 0x8 */
    int counter;      /* 0xc */
};

int func_ov005_021ad284(struct Sm021ad284 *o) {
    int ret = 0;                              /* r4 = 0 (early) */
    int st = o->state;

    if (st == 0) {
        o->counter += 1;
        func_0208c884(0x0400006c, o->counter - 0x10);
        func_0208c884(0x0400106c, o->counter - 0x10);
        if (o->counter >= 0x10) {
            o->state = 1;
            o->counter = 0;                   /* str r4(=0) */
        }
    } else if (st == 1) {
        if (func_ov005_021ae5a4() != 0) {
            o->state = 2;
            o->counter = 0;                   /* str r4(=0) */
        }
    } else if (st == 2) {
        o->counter += 1;
        func_0208c884(0x0400006c, -o->counter);
        func_0208c884(0x0400106c, -o->counter);
        if (o->counter >= 0x10) ret = 1;      /* movge r4,#1 */
    }
    return ret;
}
