/* CAMPAIGN-PREP candidate for func_02000d9c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind e(r3)+g(r4) across uses; cmpne OR-chain; reload g->0xb64 in loop
 *   risk:       orig holds g=data_021040ac in r4 across all stores AND reloads g->0xb64 each loop iter; if mwcc reloads the g base or hoists the b64 load, the ldr/str pattern diverges — reshape-able (single g local, re-read field in loop). f_10/0x3c struct-guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02000d9c (main, class C) — front-load.
 *   recipe: BIND e=base+(n-1)*16 (held r3) and g=data_021040ac (held r4); cmpne OR-chain
 * count at base+0x80; copy e->{f_4,f_8,f_c} into g->{0x3c,0x40,0x44}; g->0xb64=e->f_10-1;
 * walk while (g->0xb64+1) in {0x16,0x36,0x2e,0x38,0x26}; return (val>=4).
 */
extern char data_02105904[];
extern char data_021040ac[];
extern int func_02000d4c(void);

int func_02000d9c(void) {
    char *g;
    char *e;
    int n;
    int x;
    n = *(int *)(data_02105904 + 0x80);
    if (n == 0)
        return 0;
    e = data_02105904 + ((n - 1) << 4);
    g = data_021040ac;
    *(int *)(g + 0x3c) = *(int *)(e + 0x4);
    *(int *)(g + 0x40) = *(int *)(e + 0x8);
    *(int *)(g + 0x44) = *(int *)(e + 0xc);
    *(int *)(g + 0xb64) = *(int *)(e + 0x10) - 1;
    while (1) {
        x = *(int *)(g + 0xb64) + 1;
        if (x == 0x16 || x == 0x36 || x == 0x2e || x == 0x38 || x == 0x26) {
            *(int *)(g + 0xb64) = func_02000d4c() - 1;
            *(int *)(g + 0x3c) = 0;
            *(int *)(g + 0x40) = 0;
        } else {
            break;
        }
    }
    return x >= 4;
}
