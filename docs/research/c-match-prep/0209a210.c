/* CAMPAIGN-PREP candidate for func_0209a210 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign ok flag (movge/movlt) + redundant cmp r0,#0; blx via fn-ptr field
 *   risk:       reshape-able: orig emits movge/movlt THEN a second `cmp r0,#0;bne` (the ternary materialised then re-tested). If mwcc collapses to one compare, force it by keeping `ok` as a separate int tested with `==0` (as written). struct-guessed offsets.
 *   confidence: med
 */
/* func_0209a210 (main, class C) — like 0209a0a4 but single fixed command +
 * blx(0,4,0). g=data_021a8394.
 *   tok=DisableIrq(); r=f_02096358(6,0x3000000,0); ok=(r>=0);
 *   if (ok==0): RestoreIrq(tok); g.f34(h)|=1; cb=g.f0; if(cb) cb(0,4,0); return;
 *   else: g.f36(h)|=1; g.f34(h)&=~1; RestoreIrq(tok); return;
 * tok in r4 across the call. */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern int  func_02096358(int chan, int arg, int flags);

typedef struct {
    void (*cb)(int, int, int); /* +0x0 */
    char _p4[0x30];
    unsigned short f34;        /* +0x34 */
    unsigned short f36;        /* +0x36 */
} RegBlk2_a8394;

extern RegBlk2_a8394 data_021a8394;

void func_0209a210(void) {
    int tok;
    int ok;
    tok = OS_DisableIrq();
    ok = (func_02096358(6, 0x3000000, 0) >= 0) ? 1 : 0;
    if (ok == 0) {
        OS_RestoreIrq(tok);
        data_021a8394.f34 |= 1;
        if (data_021a8394.cb)
            data_021a8394.cb(0, 4, 0);
    } else {
        data_021a8394.f36 |= 1;
        data_021a8394.f34 &= ~1;
        OS_RestoreIrq(tok);
    }
}
