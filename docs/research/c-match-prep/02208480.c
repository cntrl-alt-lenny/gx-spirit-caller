/* CAMPAIGN-PREP candidate for func_02208480 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload global each stage (no bind across bl); >=2 then ==0 then ==1 ladder
 *   risk:       reshape-able: middle stage reuses the FIRST bff00 result (cmp r0,#2 ge then cmp r0,#0 eq on same r0) - so 2nd bff00 call is WRONG; should be one call tested >=2 else ==0. Fix: int r=bff00(...); if(r>=2)return 1; if(r==0)return 0;.
 *   confidence: med
 */
/* func_ov002_02208480: gate on func_ov002_022016bc(), then two staged checks
 * reading the cd3f4 global's f0/f28 pair. The global is RELOADED for each
 * stage (orig re-ldr's _LIT0 base both times, not bound across the bl). */
struct g3f4 { int f0; char _a[24]; int f28; };
extern struct g3f4 data_ov002_022cd3f4;
extern int func_ov002_022016bc(void);
extern int func_ov002_021bff00(int f0, int f28);
extern int func_ov002_021c034c(int f0, int f28, int one);

int func_ov002_02208480(void) {
    if (func_ov002_022016bc() == 0) return 0;
    if (func_ov002_021bff00(data_ov002_022cd3f4.f0, data_ov002_022cd3f4.f28) >= 2)
        return 1;
    if (func_ov002_021bff00(data_ov002_022cd3f4.f0, data_ov002_022cd3f4.f28) == 0)
        return 0;
    if (func_ov002_021c034c(data_ov002_022cd3f4.f0, data_ov002_022cd3f4.f28, 1) == 1)
        return 1;
    return 0;
}
