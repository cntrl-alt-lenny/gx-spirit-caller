/* CAMPAIGN-PREP candidate for func_021ac0b8 (ov008, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign clamp (movlt/movgt) not ternary-min; tst+movne/moveq = (flag&m)?a:b; reload flag word per call
 *   risk:       reshape-able (+truncated): asm cuts off mid 3rd call so the 4th bl/args are inferred; arg-eval order for the ternary flag-select feeds [sp] first — if mwcc evals call args L-to-R differently the store sequence diverges. func_ov008_021ab484 arg mapping inferred from callee.
 *   confidence: low
 */
/* func_ov008_021ac0b8: clamp a computed value into [0x2e,0x6d] with
   flag-select branches, then 1 (or 4) marshalled calls. cls C.
   NOTE: asm is truncated after the 3rd call's setup (last bl elided);
   reconstructed to the visible pattern. */

extern int data_ov008_021b2780;   /* _LIT0, [+0x634] flag word */

extern int  func_020b3870(int num, int den);
extern void func_ov008_021ab484(int a0, int a1, int e2, int e3,
                                int s30, int s34, int s38, int s3c);

void func_ov008_021ac0b8(int a0, int a1, int a2)
{
    int sel;
    int flags;

    sel = 0x2e;
    if (a2 != 0) {
        if (a0 != 0) {
            if (a0 == a1) {
                sel = 0x6d;
            } else {
                sel = 0x2e + func_020b3870(a0 * 0x3f, 1); /* rsb r0,r0,r0,lsl#6 = a0*63 */
                if (sel < 0x2e)
                    sel = 0x2e;
                else if (sel > 0x6d)
                    sel = 0x6d;
            }
        }
        flags = (&data_ov008_021b2780)[0x634 / 4];
        func_ov008_021ab484(0xdc, sel, 0, 0,
                            (flags & 0x100) ? 0x14 : 0x13,
                            0x2, 0x400, 0);
    }
    func_ov008_021ab484(0xdc, 0x29, 0, 0, 0x16, 0x2, 0x400, 1);

    flags = (&data_ov008_021b2780)[0x634 / 4];
    func_ov008_021ab484(0xdc, 0x19, 0, 0,
                        (flags & 0x40) ? 0xe : 0xd,
                        0x2, 0x400, 1);

    flags = (&data_ov008_021b2780)[0x634 / 4];
    func_ov008_021ab484(0xdc, 0x82, 0, 0,
                        (flags & 0x80) ? 0x10 : 0xf,
                        0x2, 0x400, 1);
}
