/* CAMPAIGN-PREP candidate for func_022a6d1c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     incrementing pointer induction; phase-4 counter base 0xc; inline mla product
 *   risk:       orig keeps phase-4 counter 0xc..0xf with `sub #0xc;mla` per iter; mwcc likely normalizes to 0..3 (drops the sub) and may recompute the 3 outer pointers from base*i. reshape-able; else permuter-class
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022a6d1c (ov002, class C, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Four scan phases, each early-exits return 1.
 * Phase 4 index via mla: addr = r9base + (k-0xc)*0x2c with k counter 0xc..0xf.
 *   recipe: incrementing pointer induction vars (match per-iter add); keep phase-4 counter base 0xc; inline product.
 */
extern int func_ov002_0229d2c8(void *p);
extern int func_ov002_0229e14c(void *p);
extern int func_ov002_0229e814(void *p);

int func_ov002_022a6d1c(char *base)
{
    int   i, j, k;
    char *p, *q;
    char *r8p, *r9p, *r5p;

    p = base + 0x3e0;
    for (i = 0; i < 2; i++) {
        if (func_ov002_0229e14c(p)) return 1;
        p += 0xcc;
    }

    r8p = base + 0x1b8;
    r9p = base + 0x280;
    r5p = base;
    for (i = 0; i < 2; i++) {
        q = r8p;
        for (j = 0; j < 5; j++) {
            if (func_ov002_0229d2c8(q)) return 1;
            q += 0x14;
        }
        q = r5p;
        for (j = 0; j <= 0xa; j++) {
            if (func_ov002_0229d2c8(q)) return 1;
            q += 0x14;
        }
        for (k = 0xc; k <= 0xf; k++) {
            if (func_ov002_0229e814(r9p + (k - 0xc) * 0x2c)) return 1;
        }
        r8p += 0x64;
        r5p += 0xdc;
        r9p += 0xb0;
    }
    return 0;
}
