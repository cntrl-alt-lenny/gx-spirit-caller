/* CAMPAIGN-PREP candidate for func_021cc664 (ov011, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     max as if-assign (movge); *0xa8>>8; span>>3 + &7; stack-ptr 5th arg reused.
 *   risk:       permuter-class: nine callee-saved regs hold loop invariants (r5 left, r6 count, r8 base, r9 cursor, fp=6); mwcc's induction-var (i*8 vs running r9+=8) and which constants live in regs is a scheduling/reg-rotation coin-flip.
 *   confidence: low
 */
/* func_ov011_021cc664: render a horizontal run of 8-wide cells plus a
 * remainder cell and two cap cells. Inputs lo,hi are .8 fixed; max(lo,hi)
 * sets the right edge. The span [left+0x38, right+0x38] is split into
 * (count) full 8px groups (asr#3) and a (&7) remainder; each group and the
 * caps is drawn via 021cc5c4 with a 5-arg (4 reg + 1 stack ptr) call.
 *
 *   r2=(lo*0xa8); if(hi>=lo)x=hi; r1=(x*0xa8); r2>>=8; r0=(r1>>8)+0x38;
 *   r5=r2>>8... wait: r5=(lo*0xa8>>8)+0x38 (left); right=[sp+8]=(max*0xa8>>8)+0x38
 *   span=right-left; count=span>>3 (r6); rem=span&7 ([sp+4]);
 *   base=021ca094(); loop count: 021cc5c4(6,7,0,0x10, &{ (left+8*i)<<12, base+0x8000 })
 *   if rem: 021cc5c4(6, rem-1, 0,0x10, &{ (left+8*count)<<12, base+0x8000 })
 *   021cc5c4(5,-1,0,0x10,&{ (right-3)<<12, base }); 021cc5c4(0,-1,0,0x10,&{ (left-3)<<12, base })
 */

extern int  func_ov011_021ca094(void);
extern void func_ov011_021cc5c4(int a, int b, int c, int d, void *e);

void func_ov011_021cc664(int lo, int hi) {
    int sp_arg[2];          /* {coord, handle} passed by &, at sp+0xc/0x10 */
    int right, left, span, count, rem, base, i, x;

    x = lo;
    if (hi >= lo)
        x = hi;

    right = ((x  * 0xa8) >> 8) + 0x38;
    left  = ((lo * 0xa8) >> 8) + 0x38;
    span  = right - left;
    count = span >> 3;
    rem   = span & 7;

    base = func_ov011_021ca094();

    if (count > 0) {
        i = 0;
        do {
            sp_arg[0] = (left + i * 8) << 0xc;
            sp_arg[1] = base + 0x8000;
            func_ov011_021cc5c4(6, 7, 0, 0x10, sp_arg);
            i++;
        } while (i < count);
    }

    if (rem != 0) {
        sp_arg[0] = (left + count * 8) << 0xc;
        sp_arg[1] = base + 0x8000;
        func_ov011_021cc5c4(6, rem - 1, 0, 0x10, sp_arg);
    }

    sp_arg[0] = (right - 3) << 0xc;
    sp_arg[1] = base;
    func_ov011_021cc5c4(5, -1, 0, 0x10, sp_arg);

    sp_arg[0] = (left - 3) << 0xc;
    sp_arg[1] = base;
    func_ov011_021cc5c4(0, -1, 0, 0x10, sp_arg);
}
