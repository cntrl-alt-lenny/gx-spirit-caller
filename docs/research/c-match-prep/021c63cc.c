/* CAMPAIGN-PREP candidate for func_021c63cc (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind row once (r2); 16B struct; if-block sets ret then clamp loop
 *   risk:       orig has paired cmp;mov before each loop (mov r0,#0 then mov r0,#1) — if mwcc emits while-guard not do-while+if, loop header diverges. reshape-able (try plain while with ret=1 inside).
 *   confidence: med
 */
/* func_ov006_021c63cc: clamp a 2-counter pair (a up if <0, down if >=6) on the
   active row obj+0x6c + obj[0x4c]*16; return 1 iff any clamp happened. */
struct Row63cc { int a; int b; char pad[8]; };   /* 16-byte stride row (lsl#4); a@0 b@4 */
int func_ov006_021c63cc(char *obj) {
    struct Row63cc *e = (struct Row63cc *)(obj + 0x6c) + *(int *)(obj + 0x4c);
    int ret = 0;
    if (e->a < 0) {
        ret = 1;
        do { e->a++; e->b--; } while (e->a < 0);
    }
    if (e->a >= 6) {
        ret = 1;
        do { e->a--; e->b++; } while (e->a >= 6);
    }
    return ret;
}
