/* CAMPAIGN-PREP candidate for func_021c6c78 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     struct-copy for ldmia/stmia; /4 then %20 for the umull magic; per-iter call un-hoisted.
 *   risk:       the %20 emits UMULL only if treated unsigned; signed /4 result feeding %20 may make mwcc pick SMULL or a different magic/shift -> divmod block diverge. reshape-able (cast q to unsigned for %20) else permuter-class.
 *   confidence: low
 */
/* func_ov006_021c6c78 (ov006, D) - copy a 20-int table to a stack array, index
 * it by (p->f_48 / 4) % 20, then run one of two nested halfword-store loops.
 * The umull magic = unsigned /20 and %20 on the signed /4 result; the per-
 * iteration func_0208e120() call must NOT be hoisted. */
struct Ov006Tbl20 { int v[20]; };
extern const struct Ov006Tbl20 data_ov006_021cb848;
extern int  func_0208e120(void);
extern int  func_ov006_021c6f24(void *p);

int func_ov006_021c6c78(char *p) {
    struct Ov006Tbl20 local = data_ov006_021cb848;
    int q = *(int *)(p + 0x48) / 4;
    int val = local.v[q % 20];
    int i, j;
    if (func_ov006_021c6f24(p) && val >= 0) {
        int base = val * 15 + 0x20a;
        for (i = 0; i < 3; i++) {
            for (j = 0; j < 5; j++) {
                *(unsigned short *)(func_0208e120() + i * 64 + j * 2 + 0x400 + 0xf6)
                    = (j + base) | 0x3000;
            }
            base += 5;
        }
    } else {
        for (i = 0; i < 3; i++) {
            for (j = 0; j < 5; j++) {
                *(unsigned short *)(func_0208e120() + i * 64 + j * 2 + 0x400 + 0xf6)
                    = 0x3000;
            }
        }
    }
    return 1;
}
