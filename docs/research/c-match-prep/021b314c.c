/* CAMPAIGN-PREP candidate for func_021b314c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     eval a then b; stack args via natural call order; parity mla + mul index
 *   risk:       reshape-able operand-order. Divergence risk: orig computes arg1*0x14 (mul) and parity*0x868+base (mla) as TWO separate addends fed to ldrh; mwcc may fold differently or reorder the str r5/str r0 stack writes. permuter-class scheduling. struct-guessed.
 *   confidence: med
 */
/* func_ov002_021b314c : marshal two call results onto stack + parity table lookup (class C) */
/* struct-guessed: table 022cf1a6 stride 0x14 / parity 0x868. */

extern int func_ov002_021c1ad0(void);
extern int func_ov002_021c1d4c(int a, int b);
extern void func_ov002_021b2ebc(int a, int b, int c, int d, int e, int f);
extern unsigned short data_ov002_022cf1a6[];

void func_ov002_021b314c(int arg0, int arg1, int arg2)
{
    int a;
    int b;
    int lookup;

    a = func_ov002_021c1ad0();
    b = func_ov002_021c1d4c(arg0, arg1);
    lookup = *(unsigned short *)((unsigned char *)data_ov002_022cf1a6
                                 + arg1 * 0x14 + (arg0 & 1) * 0x868);
    func_ov002_021b2ebc(arg0, lookup, arg2, 1, a, b);
}
