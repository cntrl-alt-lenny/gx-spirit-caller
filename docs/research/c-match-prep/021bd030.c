/* CAMPAIGN-PREP candidate for func_021bd030 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard + early -1 (mvnge predicated) + table scan return v+5
 *   risk:       the >=5 early return may branch instead of predicating (mvnge); else clean
 *   confidence: med
 */
/* func_ov002_021bd030: optional gate (021bb068(0x16df)!=0 -> if 021bbeac>=5
 * return -1), then scan a 5-entry table returning entry+5 on first hit of
 * func_ov002_021bcfe4(arg0, entry+5), else -1. */
extern int data_ov002_022bdfd8[];
extern int func_ov002_021bb068(int a);
extern int func_ov002_021bbeac(int a);
extern int func_ov002_021bcfe4(int a, int b);

int func_ov002_021bd030(int arg0) {
    int i;
    if (func_ov002_021bb068(0x16df) != 0) {
        if (func_ov002_021bbeac(arg0) >= 5)
            return -1;
    }
    for (i = 0; i < 5; i++) {
        int v = data_ov002_022bdfd8[i];
        if (func_ov002_021bcfe4(arg0, v + 5) != 0)
            return v + 5;
    }
    return -1;
}
