/* CAMPAIGN-PREP candidate for func_02262738 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla parity base (i&1)*0x868; :13 shift-extract compared to const; r6=i,r5=j live regs
 *   risk:       reshape-able: orig hoists base via mla once per outer iter and holds in r8 stepping +0x14 (r4/r9/sl hold the literals across both loops). If mwcc recomputes the index each inner iter instead of stepping r8, the address arithmetic diverges. Bind base+=0x14.
 *   confidence: med
 */
// func_ov002_02262738 — double counted loop, parity-mla base, :13 bitfield test
extern unsigned char data_ov002_022cf16c[];
extern void func_ov002_021d5fb4(int a, int b);

typedef struct { unsigned low13 : 13; } Slot;   /* [r8] lsl#0x13;lsr#0x13 -> :13 */

int func_ov002_02262738(void)
{
    int i, j;

    for (i = 0; i < 2; i++) {
        /* base = data + (i&1)*0x868 + 0x94, stepped by 0x14 */
        unsigned char *base = (unsigned char *)data_ov002_022cf16c
                              + (i & 1) * 0x868 + 0x94;
        for (j = 5; j < 0xa; j++) {
            unsigned v = ((unsigned)*(int *)base << 0x13) >> 0x13;
            if (v == 0x13f9) {
                func_ov002_021d5fb4(i, j);
            }
            base += 0x14;
        }
    }
    return 1;
}
