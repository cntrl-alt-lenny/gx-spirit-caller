/* CAMPAIGN-PREP candidate for func_021bc000 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     no kind-guard (only f8+flags); pipe func result into callback arg; flags shifted-or operand-first
 *   risk:       orig holds slot base in r6 (offsets +0x38/+0x40) and callback ptr in r7 across the loop; the blx-after-bl scheduling and r0 hand-off is a register coin-flip. permuter-class.
 *   confidence: med
 */
/* func_ov002_021bc000 : counted 5-loop, flag-mask, call result piped through a blx callback */
typedef struct {
    unsigned int kind:13;
    unsigned int :19;
    unsigned short _p4;
    unsigned short f6;
    unsigned short f8;       /* +0x08 */
    unsigned short _pa;
    int fc;
    unsigned int f10;        /* +0x10 */
} Slot;

extern char data_ov002_022cf16c[];
extern int func_ov002_021b9ecc(int side, int i);

int func_ov002_021bc000(int side, int (*cb)(int))
{
    Slot *s = (Slot *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30);
    int count = 0;
    int i;

    for (i = 0; i < 5; i++) {
        unsigned int f;
        if (s[i].f8 == 0) continue;
        f = s[i].f10;
        if (((f >> 2) | (f >> 1)) & 1) continue;
        if (cb(func_ov002_021b9ecc(side, i))) count++;
    }
    return count;
}
