/* CAMPAIGN-PREP candidate for func_021cc2a4 (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     strh rec before call; ordered [0x74]=0 then [0x54]--; literal-derived -1
 *   risk:       reshape-able: arg2 -1 must come from `0x42 - 0x43` (matches swarm 021c9fc4 `0x13ff-0x1400`) to emit `mov #0x42;sub #0x43`; plain `-1` gives `mvn` and diverges.
 *   confidence: med
 */
/* func_ov004_021cc2a4 (ov004, class C): small stack-marshall + ordered stores.
 * rec halfword = 0x13; func_0201cd1c(2, &rec, 2);
 * STORE ORDER: *(int*)(D+0x74)=0; (*(int*)(D+0x54))--;
 * func_02037208(0x42, 0x42-0x43, 0, 1).  Note 0x42-0x43 = -1 (literal-derived). */
extern char data_ov004_0220b500[];
extern void func_0201cd1c(int a, void *p, int b);
extern void func_02037208(int a, int b, int c, int d);

void func_ov004_021cc2a4(void) {
    unsigned short rec;
    char *D = data_ov004_0220b500;
    rec = 0x13;
    func_0201cd1c(2, &rec, 2);
    *(int *)(D + 0x74) = 0;
    *(int *)(D + 0x54) = *(int *)(D + 0x54) - 1;
    func_02037208(0x42, 0x42 - 0x43, 0, 1);
}
