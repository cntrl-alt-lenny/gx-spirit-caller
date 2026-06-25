/* CAMPAIGN-PREP candidate for func_02295748 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C bind b0 in callee r4 for calls 1/2; inline-reread p->b0 for call3; (1-b0)&1, a*500
 *   risk:       orig binds b0 (r4) for calls1/2 but re-reads it for call3; getting mwcc to bind-then-reload at exactly call3 is fragile -> mov r4 vs ldrh. permuter-class (bind/reload boundary).
 *   confidence: med
 */
/* func_ov002_02295748: scale-vs-bank-threshold predicate.
 * b0 = p->b0 (held in callee r4 across calls 1 & 2).
 *   a = 021bbf50(b0);
 *   if *(int*)(base + ((1-b0)&1)*0x868) <= a*500   -> return 1
 *   if 021bbf50(b0) > 1:
 *       if 0227d660(b0, 0) >= 0                     -> return 1
 *   return 0
 * NOTE: call 3 re-reads p->b0 from memory (separate ldrh) rather than reusing
 * r4, so the arg is written inline, not via the bound local. */
extern char data_ov002_022cf16c[];
extern int  func_ov002_021bbf50(int v);
extern int  func_ov002_0227d660(int b0, int z);

struct Ov002Hdr1 { char _p2[2]; unsigned short b0 : 1; };

int func_ov002_02295748(struct Ov002Hdr1 *p) {
    int b0 = p->b0;
    int a;

    a = func_ov002_021bbf50(b0);
    if (*(int *)(data_ov002_022cf16c + ((1 - b0) & 1) * 0x868) <= a * 500)
        return 1;
    if (func_ov002_021bbf50(b0) > 1) {
        if (func_ov002_0227d660(p->b0, 0) >= 0)
            return 1;
    }
    return 0;
}
