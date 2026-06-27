/* CAMPAIGN-PREP candidate for func_02033ac0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order local_8/5/4; lr=arg2?:0 as movs+movne/moveq; store-order out[1..3]; (1<<idx) test
 *   risk:       arg2 doubles as flag (movs r4) and base ([r4,#0x100]); 'lr = arg2?(int)arg2:0' must emit movs r4/movne lr/moveq lr — if mwcc uses a separate cmp it diverges (reshape-able via if(arg2)lr=...;else lr=0).
 *   confidence: low
 */
/* func_02033ac0 (main, class C) — stack temps + branch dispatch + store-order out.
 * r0=*p0 byte selects call; r1=out; r2=arg2 (ptr AND truthiness flag, r4); r3=ctx; stack arg4=mask.
 * locals: word local_8 (init 0, &-passed), byte local_5, byte local_4. lr = arg2?arg2:0. */
extern int func_02049710(void *ctx, unsigned char *o5, unsigned char *o4, int lr, int *o8);
extern int func_020497a8(void *ctx, unsigned char *o5, unsigned char *o4, int lr);

int func_02033ac0(unsigned char *p0, unsigned char *out, void *arg2, void *ctx, int mask)
{
    int local_8;
    unsigned char local_5;
    unsigned char local_4;
    int lr;
    int idx;

    local_8 = 0;
    lr = arg2 ? (int)arg2 : 0;
    if (*p0 == 1) {
        idx = func_020497a8(ctx, &local_5, &local_4, lr);
    } else {
        idx = func_02049710(ctx, &local_5, &local_4, lr, &local_8);
    }
    if (mask & (1 << idx)) {
        out[1] = (unsigned char)idx;
        out[2] = local_5;
        out[3] = local_4;
        if (arg2)
            *(int *)((char *)arg2 + 0x100) = local_8;
        return 1;
    }
    return 0;
}
