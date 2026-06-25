/* CAMPAIGN-PREP candidate for func_02018fbc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     conditional-store clamp; subhi/strhi & strls as if-assigns; lim reused
 *   risk:       reshape-able: comparisons are unsigned (hi/ls/bcc) — fields must be `unsigned int` or `int` to match cmp polarity; func_02013a50's return must stay live in a reg as the `t<=lim` ceiling (bind to one local `lim`), else a reload diverges.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02018fbc (main, class C) — prep batch p_0004.
 * UNVERIFIED build-free draft. Drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: counter clamp via conditional stores; subhi/strhi (>2 decrement), strls (<=clamp); if-assign form
 */
/* func_02018fbc: step=r0(->r5). w=GetSystemWork()(->r4). lim=func_02013a50(w[0x91c]).
 * If w[0x924] > 2: w[0x924]-- (subhi/strhi) and DONE. Else: w[0x924]=1; if w[0x928]==0:
 * t = w[0x920] + step; if t <= lim: w[0x920]=t (strls) ELSE func_02018fa0(1); w[0x920]=1.
 * Tail (always): w[0x8d8] = (w[0x8d8] & ~1) | 1. lim is the func_02013a50 return reused as the
 * clamp ceiling (return-reg r0 held across the cmp). Conditional decrement/clamp as if-assigns. */
extern char *GetSystemWork(void);
extern int func_02013a50(int v);
extern void func_02018fa0(int v);

void func_02018fbc(int step) {
    char *w = GetSystemWork();
    int lim = func_02013a50(*(int *)(w + 0x91c));
    if (*(int *)(w + 0x924) > 2) {
        *(int *)(w + 0x924) = *(int *)(w + 0x924) - 1;
    } else {
        *(int *)(w + 0x924) = 1;
        if (*(int *)(w + 0x928) == 0) {
            int t = *(int *)(w + 0x920) + step;
            if (t <= lim) {
                *(int *)(w + 0x920) = t;
            } else {
                func_02018fa0(1);
                *(int *)(w + 0x920) = 1;
            }
        }
    }
    *(int *)(w + 0x8d8) = (*(int *)(w + 0x8d8) & ~1) | 1;
}
