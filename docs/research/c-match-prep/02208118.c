/* CAMPAIGN-PREP candidate for func_02208118 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :6 guard, intentionally-uninitialised select var (if/else-if), reuse 0x175b+0x9b, :1 to calls
 *   risk:       sel deliberately uninitialised when neither case hits (matches r4-unset) — must NOT add default. Risk: mwcc may load 0x17f6 fresh instead of add #0x9b to the held 0x175b. reshape-able (operand reuse); else minor.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct { u16 _0; u16 a : 6; u16 b6 : 6; u16 sel : 1; u16 _r : 3; } Arg;

extern int func_ov002_021bb90c(int a, int b);
extern int func_ov002_021b3ecc(int a, int b, int c);

int func_ov002_02208118(Arg *p)
{
    int sel;
    if (p->b6 == 0x23)
        return 1;
    if (p->_0 == 0x175b)
        sel = 0xfa7;
    else if (p->_0 == 0x17f6)
        sel = 0xff8;
    if (func_ov002_021bb90c(p->sel, sel) == 0)
        return 0;
    if (func_ov002_021b3ecc(p->sel, 0xb, sel) != 0)
        return 0;
    return 1;
}
