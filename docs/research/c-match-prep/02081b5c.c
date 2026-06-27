/* CAMPAIGN-PREP candidate for func_02081b5c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     count reloaded each iter, base=s+8 bound, mla index, &=-fold
 *   risk:       reshape-able: the mla (stride*i + base+off) may split into add+lsl unless i*stride stays a single product; inline so only the product CSEs, keep base+off bound.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02081b5c (main, class C) - p_0033.
 * UNVERIFIED build-free draft: drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: count=s->9 reloaded each iter; base=s+8 bound; mla stride*i index; r5 &= two call results
 */
/* func_02081b5c: AND-fold the results of two per-child callbacks over
 * children[count], where each child record is reached via a stride table
 * at s+8 (header off s->0xe). */

extern int func_02081bd8(void *child, int arg);
extern int func_02081d18(void *child);

int func_02081b5c(unsigned char *s, int arg) {
    int acc = 1;
    int i = 0;
    if (s[9] != 0) {
        unsigned char *base = s + 8;
        do {
            unsigned short off = *(unsigned short *)(s + 0xe);
            unsigned short stride = *(unsigned short *)(base + off);
            int p = *(int *)((base + off) + stride * i + 4);
            void *child = (void *)(s + p);
            acc &= func_02081d18(child);
            acc &= func_02081bd8(child, arg);
            i++;
        } while (i < (int)(unsigned char)s[9]);
    }
    return acc;
}
