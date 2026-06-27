/* CAMPAIGN-PREP candidate for func_021e7918 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: 1-bit + 5-bit extract, OR-pack A|(B<<8), zero-ext compare
 *   risk:       reshape-able: the &0xff masks come from char-typed temps (keep unsigned char casts); main risk is operand-order of the orr (fa first picks dest) and binding card in r4 across the call -- decl/cast tweaks should close it.
 *   confidence: med
 */
/* func_ov002_021e7918: pack two bitfields of card->state2 into A|(B<<8),
 * compare to a helper result. A=bit0 (1-bit), B=bits[5:1] (5-bit).
 * helper(arg0=r1, arg1=r2, 0); if result==0xffff -> 1; else compare. */
extern int func_ov002_021b39c4(int a, int b, int c);

typedef struct {
    unsigned short id;       /* +0x0 */
    unsigned short state2;   /* +0x2 */
} Card021e7918;

int func_ov002_021e7918(Card021e7918 *card, int a, int b) {
    int r = func_ov002_021b39c4(a, b, 0);
    if (r == 0xffff)
        return 1;
    {
        unsigned int s = card->state2;
        unsigned int fa = (unsigned char)(s & 1);           /* bit0 */
        unsigned int fb = (unsigned char)((s >> 1) & 0x1f); /* bits[5:1] */
        unsigned int packed = (unsigned short)(fa | (fb << 8));
        if (r != (int)packed)
            return 0;
        return 1;
    }
}
