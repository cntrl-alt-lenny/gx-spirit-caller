/* CAMPAIGN-PREP candidate for func_0207cd7c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind flag base g; descending store-order 0x24/0x8/0x4 exact; arg=&data_021a089c
 *   risk:       orig loads `&data_021a089c` (r0) EARLY and holds it across the 3 zero-stores until the bl; if mwcc materializes the address late (after stores) the literal-load position shifts. permuter-class (scheduling of the held address); low byte-impact.
 *   confidence: high
 */
/* func_0207cd7c: run-once init guarded by data_021a0890 byte flag.
 * if (data_021a0890[0] != 0) return;
 * data_021a0890[0] = 1;
 * store-order: g[0x24]=0; g[0x8]=0; g[0x4]=0;   (exact asm order)
 * func_02092844(&data_021a089c);
 */
extern unsigned char data_021a0890;
extern unsigned char data_021a089c;
extern void func_02092844(void *);

void func_0207cd7c(void) {
    char *g = (char *)&data_021a0890;
    if (*g != 0) return;
    *g = 1;
    *(int *)(g + 0x24) = 0;
    *(int *)(g + 0x8) = 0;
    *(int *)(g + 0x4) = 0;
    func_02092844(&data_021a089c);
}
