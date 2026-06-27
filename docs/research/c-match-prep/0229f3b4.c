/* CAMPAIGN-PREP candidate for func_0229f3b4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     int* field guard chain; (n+1)%17 via signed magic (0x78787879)
 *   risk:       reshape-able: orig computes n=f18+1 once then n%17 (one add ip,#1 reused). If mwcc recomputes +1 or picks /17 vs *17-sub differently, adjust to a temp `int n=s[6]+1; s[6]=n%17;`.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229f3b4 (ov002, class D, MED tier).
 * UNVERIFIED. clean-ish leaf: early returns + mod-17 magic divide.
 *   recipe: guard chain on int* fields; s->f18 = (s->f18 + 1) % 17 via 0x78787879 magic.
 */
void func_ov002_0229f3b4(int *s) {
    if (s[0] == 0) return;          /* [0x00] */
    s[1] = 0;                       /* [0x04] = 0 */
    if (s[2] >= 0x10) {             /* [0x08] */
        if (s[6] == 0x10) s[6] = 0; /* [0x18] */
    }
    if (s[6] == 0) return;
    s[6] = (s[6] + 1) % 17;         /* 0x78787879 smull, asr#3 */
}
