/* CAMPAIGN-PREP candidate for func_021bc0d4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl g1/g2 in eval order; short-circuit || so f8/f6 load under the ne-predicate; kind continue-guard
 *   risk:       orig materializes the two booleans with movcc chains and keeps constant 1 mirrored in r5 and lr across the loop; mwcc's boolean lowering and that twin-const are very unlikely to reproduce. permuter-class.
 *   confidence: low
 */
/* func_ov002_021bc0d4 : counted 5-loop, two predicated guards combined */
typedef struct {
    unsigned int kind:13;
    unsigned int :19;
    unsigned short _p4;
    unsigned short f6;       /* +0x06 */
    unsigned short f8;       /* +0x08 */
    unsigned short _pa;
    int fc;
    unsigned int f10;
} Slot;

extern char data_ov002_022cf16c[];

int func_ov002_021bc0d4(int side, int a, int b)
{
    Slot *s = (Slot *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30);
    int count = 0;
    int i;

    for (i = 0; i < 5; i++) {
        int g1, g2;
        if (s[i].kind == 0) continue;
        g1 = (a == 0) || (s[i].f8 != 0);   /* f8 read only when a!=0 */
        g2 = (b == 0) || (s[i].f6 == 0);   /* f6 read only when b!=0 */
        if (g1 && g2) count++;
    }
    return count;
}
