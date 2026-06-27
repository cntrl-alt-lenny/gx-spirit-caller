/* CAMPAIGN-PREP candidate for func_021ab43c (ov020, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     identical clone recipe to 021ab364, palette nibble 0xe000; mla index; inner counter from shared j
 *   risk:       reshape-able: same as 021ab364 — `int j=0; int k=j;` reproduces the orig's `mov r1,ip; mov r4,r1` inner-init; only divergence risk is that inner-start mov if collapsed to `int k=0`. Pointer math and row gap exact; high confidence given the clone.
 *   confidence: med
 */
/* func_ov020_021ab43c: clone of 021ab364 differing only in the palette nibble
 * (0xe000 vs 0xf000). 4 rows x 25 cols, tile index = row*100+1 then ++. */
extern unsigned short *func_0208e1cc(void);

void func_ov020_021ab43c(int unused, int row) {
    unsigned short *p = func_0208e1cc();
    int idx = row * 100 + 1;
    int i;
    int j = 0;
    p += ((row * 5 + 4) * 32 + 5);
    for (i = 0; i < 4; i++) {
        int k = j;
        for (; k < 25; k++) {
            *p++ = idx | 0xe000;
            idx++;
        }
        p += 7;
    }
}
