/* CAMPAIGN-PREP candidate for func_021bbc68 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order side/count/i; continue-guards; flags shifted-or operand-first; (side&1)*0x868 mla base
 *   risk:       orig keeps base(r7) and elem(r6=base+0x30) as TWO lockstep pointers; if mwcc folds to one scaled-index base the loop addressing diverges. reshape-able (pointer-walk).
 *   confidence: med
 */
/* func_ov002_021bbc68 : per-side slot scan, counted 5-loop with continue-guards and a callback */
typedef struct {
    unsigned int kind:13;   /* +0x00, read via lsl#19;lsrs#19 (low 13 bits) */
    unsigned int :19;
    unsigned short _p4;      /* +0x04 */
    unsigned short f6;       /* +0x06 */
    unsigned short f8;       /* +0x08 */
    unsigned short _pa;      /* +0x0a */
    int fc;                  /* +0x0c */
    unsigned int f10;        /* +0x10 (flags) */
} Slot;                      /* sizeof = 0x14 */

extern char data_ov002_022cf16c[];
extern int func_ov002_021c93cc(int side, int arg, int i);

int func_ov002_021bbc68(int side, int arg, int limit)
{
    Slot *s = (Slot *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30);
    int count = 0;
    int i;

    for (i = 0; i < 5; i++) {
        unsigned int f;
        if (i == limit) continue;
        if (s[i].kind == 0) continue;
        if (s[i].f8 == 0) continue;
        f = s[i].f10;
        if (((f >> 2) | (f >> 1)) & 1) continue;
        if (func_ov002_021c93cc(side, arg, i)) count++;
    }
    return count;
}
