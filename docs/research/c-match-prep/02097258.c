/* CAMPAIGN-PREP candidate for func_02097258 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ret=0 seed; busy=(f1c&8)!=0 cmov; ok=!busy cmov; clear-bit+call; tail-guard; return ok
 *   risk:       orig materialises busy then ok as a two-step movne/moveq + cmp + moveq/movne pair (r0 busy, r7 ok); mwcc may collapse !(f1c&8) to a single test, dropping the intermediate r0 - reshape-able (keep busy and ok as separate int locals so both bool reifications emit)
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02097258 (main, class C) - p_0044.
 * UNVERIFIED build-free draft: drop into src/, ninja + objdiff, tweak per risk.
 *   recipe:     ret=0 r6 init; IRQ token r5; busy=(f1c&8)!=0 cmov, ok=!busy cmov; if(ok) clear bit + ret=call; restore; if(ret) func_02097a4c(ret); return ok
 *   risk:       see risk note
 *   confidence: med
 */
/* func_02097258(p): ret=0; tok=OS_DisableIrq(); busy=(p->f1c&8)!=0; ok=!busy;
 *   if(ok){ p->f1c&=~8; ret=func_02097af0(p); } OS_RestoreIrq(tok);
 *   if(ret) func_02097a4c(ret); return ok. Both bools materialised via movne/moveq (r6 ret seed, r7 ok). */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int token);
extern void func_02097a4c(int x);
extern int  func_02097af0(void *p);

typedef struct {
    unsigned char pad00[0x1c];
    unsigned int  f1c;   /* 0x1c flags */
} Obj02097258;

int func_02097258(Obj02097258 *p)
{
    int token;
    int ret;
    int busy;
    int ok;

    ret = 0;
    token = OS_DisableIrq();

    busy = (p->f1c & 0x8) != 0;
    ok = !busy;
    if (ok) {
        p->f1c &= ~0x8;
        ret = func_02097af0(p);
    }

    OS_RestoreIrq(token);

    if (ret) {
        func_02097a4c(ret);
    }
    return ok;
}
