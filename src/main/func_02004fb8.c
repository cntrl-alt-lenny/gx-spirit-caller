/* CAMPAIGN-PREP candidate for func_02004fb8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     thin forwarder; tail-return; r2=0, shift c into 4th slot, fn as 7th arg
 *   risk:       stmia sp,{r3,lr} fuses the d,e stack-arg stores into one block; if mwcc splits them into two str the outgoing-arg encoding diverges — reshape-able (arg order already matches). func_02004ef4 arg-count (7) inferred from its sp+0x10/14/18 reads.
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_02004fb8 (main, class C) — front-load.
 *   recipe: forwarder; tail-return func_02004ef4(a,b,0,c,d,e,func_02003b14)
 * 7-arg callee: r0-r3 + 3 stacked (stmia sp,{r3=d,lr=e}; str func_02003b14).
 */
extern int func_02003b14(void);
extern int func_02004ef4(int a, int b, int c, int d, int e, int f, void *fn);

int func_02004fb8(int a, int b, int c, int d, int e) {
    return func_02004ef4(a, b, 0, c, d, e, func_02003b14);
}
