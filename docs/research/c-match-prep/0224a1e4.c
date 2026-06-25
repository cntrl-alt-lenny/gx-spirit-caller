/* CAMPAIGN-PREP candidate for func_0224a1e4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two sequential counted loops, CSE side-offset r5, decl-order
 *   risk:       reshape-able/permuter-class: orig CSEs the mul offset r5 across BOTH loops and reuses r5 as loop counter in 2nd (mov r5,#0xe). mwcc may not reuse the same reg; r4/r5/r7/r8 rotation is a scheduling coin-flip. Keep one `off` local feeding both arrays.
 *   confidence: low
 */
extern unsigned char data_ov002_022cf16c[2][0x868];
extern int data_ov002_022cf17c[2][0x868 / 4];
extern int data_ov002_022cf180[2][0x868 / 4];

extern void func_ov002_02253458(int a, int b, int c);

extern void func_ov002_0224a1e4(int arg0);

void func_ov002_0224a1e4(int arg0)
{
    int side = arg0 & 1;
    int i;
    unsigned char *base;

    if (data_ov002_022cf17c[side][0] != 0) {
        base = data_ov002_022cf16c[side];
        i = 0;
        do {
            func_ov002_02253458(arg0, 0xd, i);
            i++;
        } while (i < *(int *)(base + 0x10));
    }

    if (data_ov002_022cf180[side][0] == 0)
        return;

    base = data_ov002_022cf16c[side];
    i = 0;
    do {
        func_ov002_02253458(arg0, 0xe, i);
        i++;
    } while (i < *(int *)(base + 0x14));
}
