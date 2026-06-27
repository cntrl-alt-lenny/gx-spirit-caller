/* CAMPAIGN-PREP candidate for func_02203eb4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ce720[idx]=0 store; count reloaded per-iter; double-mla addr; hi/lo via asr;and
 *   risk:       permuter-class: loop body's double-mla address (cf16c+(lo&1)*0x868+hi*20+0x38) and the two arg-less calls invite reg-recolor/scheduling drift across the loop.
 *   confidence: low
 */
/* func_ov002_02203eb4: cls D. Clear a ce720 ring slot, gate on 021ff46c();
 * then scan arg1->f6 entries (count RELOADED each iter): for each, resolve
 * (lo,hi)=0223de94(arg1,i); if hi<=4 and cf16c[(lo&1)*0x868 + hi*20 + 0x38]
 * u16 is nonzero, fire 0202e79c(021b9ecc(lo,hi)) -> return 1. Else return 0. */
typedef unsigned short u16;

extern char data_ov002_022ce288[];
extern u16  data_ov002_022ce720[];
extern char data_ov002_022cf16c[];
extern int  func_ov002_021ff46c(void);
extern int  func_ov002_0223de94(void *node, int idx);
extern int  func_ov002_021b9ecc(int a, int b);
extern int  func_0202e79c(int a);

int func_ov002_02203eb4(void *self, void *arg1) {
    int i;
    if (arg1 == 0) return 0;
    data_ov002_022ce720[*(int *)(data_ov002_022ce288 + 0x494) & 0x7f] = 0;
    if (func_ov002_021ff46c() == 0) return 0;
    for (i = 0; i < (*(u16 *)((char *)arg1 + 6) & 0xff); i++) {
        int ret = func_ov002_0223de94(arg1, i);
        int hi = ((u16)ret >> 8) & 0xff;
        int lo;
        if (hi > 4) continue;
        lo = ret & 0xff;
        if (*(u16 *)(data_ov002_022cf16c + (lo & 1) * 0x868 + hi * 20 + 0x38) == 0)
            continue;
        if (func_0202e79c(func_ov002_021b9ecc(lo, hi)) != 0) return 1;
    }
    return 0;
}
