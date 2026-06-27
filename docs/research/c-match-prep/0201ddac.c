/* CAMPAIGN-PREP candidate for func_0201ddac (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two u8-window extracts (lsl;lsr#0x18); reload on else-branch; nested >=0x20 compare ladder
 *   risk:       reshape-able/permuter-class: orig RELOADS a[0x1c] in the lo<=0x20 branch (second ldr) and reuses ip across the cmp ladder; if mwcc hoists one load or rotates lr, keep the explicit reload + match movge-chains via if/else-if — branch fold order is fragile.
 *   confidence: low
 */
/* func_0201ddac (main, class D) — two signed :6 bitfields packed in word a[0x1c]
 * (bits 0..5 = lo at lsl#0x18>>0x18, bits 8..13 = hi at lsl#0x10>>0x18),
 * compared against threshold 0x20, plus two more args r1/r2. Returns one of
 * {0, 0x800, 0x1000, 0x1800} encoding which of (lo>0x20, hi>0x20, r1>=0x20,
 * r2>=0x20) hold. The two field extracts use lsl#k;lsr#0x18 => unsigned :8 of
 * a byte window; but the field width is a byte so model as u8 reads at the
 * matching sub-offsets of the word. */
unsigned int func_0201ddac(char *a, int r1, int r2) {
    unsigned int w  = *(unsigned int *)(a + 0x1c);
    unsigned int lo = (w << 0x18) >> 0x18;   /* byte 0 of word */
    unsigned int hi;
    int r = 0;
    if (lo > 0x20) {
        hi = (w << 0x10) >> 0x18;            /* byte 1 of word */
        if (hi > 0x20) {
            if (r1 >= 0x20 && r2 >= 0x20)      r = 0x1800;
            else if (r1 >= 0x20)               r = 0x800;
            else if (r2 >= 0x20)               r = 0x1000;
        } else {
            if (r1 >= 0x20)                    r = 0x800;
        }
    } else {
        /* reload a[0x1c] and re-extract byte 1 (orig does ldr again here) */
        hi = ((unsigned int)(*(unsigned int *)(a + 0x1c)) << 0x10) >> 0x18;
        if (hi > 0x20) {
            if (r2 >= 0x20)                    r = 0x800;
        }
    }
    return (unsigned int)r;
}
