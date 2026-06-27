/* CAMPAIGN-PREP candidate for func_021bd4ec (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :13 extract bound to r9 then reused across BOTH calls; bank-mul base; bound reloaded per iter
 *   risk:       reshape-able: orig keeps the extracted field in r9 across both 0202b878 and 0202b8c0 — bind it to one local `f` (done). If mwcc re-extracts before 0202b8c0 two lsl/lsr diverge; the single `f` temp is the lever.
 *   confidence: med
 */
/* func_ov002_021bd4ec (ov002, class D): scan; bank = arg0&1 (stride 0x868),
 * count from data_022cf180[bank]. Per iter extract the :13 field (+0x418 of
 * data_022cf16c) into one temp; only when 0202b878(field)==0x17 compare
 * 0202b8c0(field) to arg1, counting equals. Bound = +0x14 word of bank base. */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int  func_0202b878(int v);
extern int  func_0202b8c0(int v);

int func_ov002_021bd4ec(int obj, int key) {
    int bank = (obj & 1) * 0x868;
    char *base;
    int *field;
    int count;
    int i;
    int n;
    int f;

    n = *(int *)(data_ov002_022cf180 + bank);
    count = 0;
    i = 0;
    if (n > 0) {
        base = data_ov002_022cf16c + bank;
        field = (int *)(base + 0x18 + 0x400);
        do {
            f = (*field << 19) >> 19;
            if (func_0202b878(f) == 0x17) {
                if (key == func_0202b8c0(f))
                    count++;
            }
            i++;
            field++;
        } while (i < *(int *)(base + 0x14));
    }
    return count;
}
