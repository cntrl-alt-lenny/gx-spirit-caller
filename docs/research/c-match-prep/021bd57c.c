/* CAMPAIGN-PREP candidate for func_021bd57c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bd364-family; +0x5d0 field offset, bound from +0x1c, count base data_022cf188; :13 inline
 *   risk:       reshape-able: same family as bd364 — orig reloads `[base,#0x1c]` per iter and orders `cmp r8,r0` (key first). Keep the bound as an in-loop deref and key as the left cmp operand, else cmp/bcc flips.
 *   confidence: med
 */
/* func_ov002_021bd57c (ov002, class D): counted scan; bank = arg0&1 (stride
 * 0x868), count from data_022cf188[bank]. Per iter read the :13 field at +0x5d0
 * of data_022cf16c (base+0x5d0); compare 0202b878(field) to arg1; the live
 * loop bound is the +0x1c word of the bank base. */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf188[];
extern int  func_0202b878(int v);

int func_ov002_021bd57c(int obj, int key) {
    int bank = (obj & 1) * 0x868;
    char *base;
    int *field;
    int count;
    int i;
    int n;

    n = *(int *)(data_ov002_022cf188 + bank);
    count = 0;
    i = 0;
    if (n > 0) {
        base = data_ov002_022cf16c + bank;
        field = (int *)(base + 0x5d0);
        do {
            if (key == func_0202b878((*field << 19) >> 19))
                count++;
            i++;
            field++;
        } while (i < *(int *)(base + 0x1c));
    }
    return count;
}
