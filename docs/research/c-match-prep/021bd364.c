/* CAMPAIGN-PREP candidate for func_021bd364 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :13 extract inline (lsl19/lsr19); bank-mul base CSE'd; bound reloaded from [base,#0x14] each iter
 *   risk:       reshape-able: orig RELOADS the bound `ldr r0,[r7,#0x14]` every iteration and increments r4 before the cmp; if mwcc hoists it the cmp/bcc shape diverges. Keep the bound as an in-loop deref and key as the left cmp operand.
 *   confidence: med
 */
/* func_ov002_021bd364 (ov002, class D): counted scan; bank = arg0&1 (stride
 * 0x868). Loop count word at data_022cf180[bank]; per-iter read the :13 field
 * at +0x418 of data_022cf16c (base+0x18+0x400) and compare 0202b878(field) to
 * arg1; the live loop bound is the +0x14 word of the 0x868-strided base. */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int  func_0202b878(int v);

int func_ov002_021bd364(int obj, int key) {
    int bank = (obj & 1) * 0x868;
    char *base;
    int *field;
    int count;
    int i;
    int n;

    n = *(int *)(data_ov002_022cf180 + bank);
    count = 0;
    i = 0;
    if (n > 0) {
        base = data_ov002_022cf16c + bank;
        field = (int *)(base + 0x18 + 0x400);
        do {
            if (key == func_0202b878((*field << 19) >> 19))
                count++;
            i++;
            field++;
        } while (i < *(int *)(base + 0x14));
    }
    return count;
}
