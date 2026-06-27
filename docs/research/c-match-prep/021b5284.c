/* CAMPAIGN-PREP candidate for func_021b5284 (ov016, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     divmod: %3 then /3 as separate exprs (no CSE); mla via inline (i+1)*0xa; switch jump-table
 *   risk:       reshape-able: mwcc may strength-reduce the loop addr to an induction var (add 0xa) instead of recomputing mla each iter; keep (i+1)*0xa inside the call to force mla.
 *   confidence: med
 */
/* func_ov016_021b5284 (ov016, class D): scan up to 14 records (record i at
 * data+(i+1)*0xa) for the first where probe()!=0; default index 0xf. If
 * idx>=0xf return 0. Otherwise dispatch on idx, writing two ints at obj+0x18
 * and obj+0x1c. idx 0..3 are a jump table, idx 4 is special, idx 5..13 use a
 * divmod-by-3 (smull 0x55555556) where +0x18 = (idx-5)%3, +0x1c = (idx-5)/3.
 *
 * mla r0,(i+1),0xa,base => probe(data + (i+1)*0xa); base = data_ov016_021b9184.
 * The %3 and /3 are emitted as TWO separate smull sequences (CSE not applied),
 * so they are written as independent expressions, remainder stored first. */

extern int func_ov016_021b287c(void *rec);
extern unsigned char data_ov016_021b9184[];

int func_ov016_021b5284(int *obj) {
    int idx;
    int i;
    int n;

    idx = 0xf;
    for (i = 0; i < 14; i++) {
        if (func_ov016_021b287c(data_ov016_021b9184 + (i + 1) * 0xa) != 0) {
            idx = i;
            break;
        }
    }

    if (idx >= 0xf)
        return 0;

    switch (idx) {
    case 0:
    case 1:
        obj[6] = idx + 1;   /* +0x18 */
        obj[7] = 3;         /* +0x1c */
        break;
    case 2:
        obj[6] = 3;
        obj[7] = 2;
        break;
    case 3:
        obj[6] = 3;
        obj[7] = 1;
        break;
    case 4:
        obj[6] = 0;
        obj[7] = 3;
        break;
    default:                /* 5..13 */
        n = idx - 5;
        obj[6] = n % 3;     /* remainder stored first */
        obj[7] = n / 3;
        break;
    }
    return 1;
}
