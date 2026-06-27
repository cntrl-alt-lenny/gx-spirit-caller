/* CAMPAIGN-PREP candidate for func_0201bb88 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind a(r4)/sys(r5); &&-chain with cmpeq; r==2||5||7 = cmp;cmpne;cmpne; orr+store flag
 *   risk:       reshape-able: the first guard is `cmp f8,#0; ldreq sys+0x918; cmpeq` (the +0x918 load is predicated on f8==0); writing it as a plain && may emit an unconditional ldr — keep both in one && so mwcc predicates the second load.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0201bb88 (main, class C) — UNVERIFIED build-free draft.
 * Guard chain; a=r0 (kept r4), sys=GetSystemWork() (r5). Returns 0 unless all guards pass.
 *   if (a->f8 != 0) return 0;                         // cmp r1,#0 then cmpeq
 *   if (*(int*)(sys+0x918) != 0) return 0;            // the eq-chained cmp
 *   if (func_020190f0() != 0xff) return 0;
 *   if ((( *(int*)(sys+0x900) <<7)>>31) != 0) return 0;   // bit24 set -> bail
 *   r = func_0201b7a0(a);
 *   if (r!=2 && r!=5 && r!=7) return 0;
 *   a->f10 |= 0x2000; return 1; */
extern char *GetSystemWork(void);
extern int func_020190f0(void);
extern int func_0201b7a0(char *a);

int func_0201bb88(char *a) {
    char *r5 = GetSystemWork();
    int r;
    if (*(int *)(a + 8) == 0 && *(int *)(r5 + 0x918) == 0 &&
        func_020190f0() == 0xff &&
        ((unsigned int)((unsigned int)*(int *)(r5 + 0x900) << 7) >> 0x1f) == 0) {
        r = func_0201b7a0(a);
        if (r == 2 || r == 5 || r == 7) {
            *(int *)(a + 0x10) |= 0x2000;
            return 1;
        }
    }
    return 0;
}
