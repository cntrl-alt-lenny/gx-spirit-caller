/* CAMPAIGN-PREP candidate for func_0201bd30 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     first &&-guard predicates sys+0x918 load; reload func_0201b7e0 (don't cache); if-assign orr+str bit set
 *   risk:       reshape-able: first guard's `cmp f8,#0; ldreq sys+0x918; cmpeq` predicates the +0x918 load -> keep both in one && or mwcc emits an unconditional ldr. func_0201b7e0 must be called fresh each time, not bound.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0201bd30 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Nested guard chain; func_0201b7e0 is RELOADED each use
 * (NOT cached). On pass, set one of four bits in arg+0x10 via if-assign (orreq/orrne+str).
 * Always returns 0.
 */
extern char *GetSystemWork(void);
extern int func_020139c4(void);
extern int func_020190ec(void);
extern int func_020190c0(void);
extern int func_0201b7e0(void *);

int func_0201bd30(void *arg) {
    char *sys = GetSystemWork();
    if (*(int *)((char *)arg + 8) == 0 && *(int *)(sys + 0x918) == 0 &&
        func_020139c4() == 0 && func_020190ec() != 0 &&
        (func_0201b7e0(arg) == 5 || func_0201b7e0(arg) == 4)) {
        if (func_020190c0() == 1) {
            if (func_0201b7e0(arg) == 4)
                *(int *)((char *)arg + 0x10) |= 0x20000;
            else
                *(int *)((char *)arg + 0x10) |= 0x10000;
        } else {
            if (func_0201b7e0(arg) == 4)
                *(int *)((char *)arg + 0x10) |= 0x8000;
            else
                *(int *)((char *)arg + 0x10) |= 0x4000;
        }
    }
    return 0;
}
