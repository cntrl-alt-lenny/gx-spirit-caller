/* CAMPAIGN-PREP candidate for func_021bd09c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     count loop + cap clamp re-evaluated + floor (021bc618 clone)
 *   risk:       reg-alloc j=r4/count=r5/arg0=r6; clamp 2x re-call must reproduce (matches sibling)
 *   confidence: high
 */
/* func_ov002_021bd09c: count j in [5,10) with func_ov002_021bcfe4(arg0,j)!=0,
 * then (if 021bb068(0x16df)!=0) clamp the count to 5-021bbeac(arg0) (the cap
 * re-evaluated) and floor at 0. Near-clone of shipped func_ov002_021bc618. */
extern int func_ov002_021bcfe4(int a, int b);
extern int func_ov002_021bb068(int a);
extern int func_ov002_021bbeac(int a);

int func_ov002_021bd09c(int arg0) {
    int j;
    int count = 0;
    for (j = 5; j < 10; j++) {
        if (func_ov002_021bcfe4(arg0, j) != 0)
            count++;
    }
    if (func_ov002_021bb068(0x16df) != 0) {
        if (count >= 5 - func_ov002_021bbeac(arg0))
            count = 5 - func_ov002_021bbeac(arg0);
        if (count <= 0)
            count = 0;
    }
    return count;
}
