/* CAMPAIGN-PREP candidate for func_021bd3e0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: clone of bd364, swap callee 0202b890; same :13 inline, bank-mul CSE, bound reload per iter
 *   risk:       reshape-able: identical to bd364 — orig reloads `[base,#0x14]` per iter and orders `cmp r8,r0` (key first). Use the SAME C shape as bd364; bound must remain an in-loop deref or the cmp/bcc diverges.
 *   confidence: med
 */
/* func_ov002_021bd3e0 (ov002, class D): byte-shape clone of 021bd364; only the
 * compared callee differs (0202b890 vs 0202b878). Counted scan over the
 * 0x868-strided (bank=arg0&1) table at data_022cf16c +0x418; loop bound from
 * the +0x14 word; count when 0202b890(field13)==arg1. */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int  func_0202b890(int v);

int func_ov002_021bd3e0(int obj, int key) {
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
            if (key == func_0202b890((*field << 19) >> 19))
                count++;
            i++;
            field++;
        } while (i < *(int *)(base + 0x14));
    }
    return count;
}
