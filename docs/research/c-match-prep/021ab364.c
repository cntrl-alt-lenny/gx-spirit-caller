/* CAMPAIGN-PREP candidate for func_021ab364 (ov020, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla index r4*100+1; inner counter copied from shared j(=0) to steer reg; orr tile|0xf000; post-inc strh
 *   risk:       reshape-able: orig copies the inner start from an outer var (mov r1,ip; mov r4,r1) — the `int j=0; int k=j;` reproduces it; collapsing to `int k=0` may drop a mov. (row*5+4)*32+5 pointer math and the +7 (0xe byte) row gap are exact. Loop body well-bounded.
 *   confidence: med
 */
/* func_ov020_021ab364: fill a 4-row x 25-col block of the BG map returned by
 * func_0208e1cc with palette-15 tiles, tile index = row*100+1 then ++ per cell.
 * Row stride 32 halfwords (25 written + 7 skipped). */
extern unsigned short *func_0208e1cc(void);

void func_ov020_021ab364(int unused, int row) {
    unsigned short *p = func_0208e1cc();
    int idx = row * 100 + 1;
    int i;
    int j = 0;
    p += ((row * 5 + 4) * 32 + 5);
    for (i = 0; i < 4; i++) {
        int k = j;
        for (; k < 25; k++) {
            *p++ = idx | 0xf000;
            idx++;
        }
        p += 7;
    }
}
