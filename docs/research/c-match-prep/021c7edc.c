/* CAMPAIGN-PREP candidate for func_021c7edc (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     outer i then inner j; reload bounds each pass; store j,i in asm order
 *   risk:       orig seeds the inner counter via mov r7,r4 / mov r8,r7 (hoisted reset) and keeps base in r6 across the call. if mwcc picks a different inner-init reg the two mov insns reorder. permuter-class (loop init scheduling), bodies match.
 *   confidence: med
 */
/* func_ov006_021c7edc: scan the [0x7c]x[0x78] grid (row-major, outer=i) calling
   021c9c54(base,j,i); on the first cell whose code==key store j->+0x80, i->+0x84
   and return 1; else 0. */
extern int func_ov006_021c9c54(void *p, int col, int row);
int func_ov006_021c7edc(char *base, int key) {
    int i, j;
    for (i = 0; i < *(int *)(base + 0x7c); i++) {
        for (j = 0; j < *(int *)(base + 0x78); j++) {
            if (key == func_ov006_021c9c54(base, j, i)) {
                *(int *)(base + 0x80) = j;
                *(int *)(base + 0x84) = i;
                return 1;
            }
        }
    }
    return 0;
}
