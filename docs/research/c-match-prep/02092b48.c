/* CAMPAIGN-PREP candidate for func_02092b48 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     branch-table switch + signed clamp via cmp/movcc if-assign; mov-imm not ldr
 *   risk:       struct-guessed/INCOMPLETE: literal pool truncated in batch (_LIT4.._LIT7 words missing) — 0x2700000/0x2000000 are mov-immediates (keep as int constants so mwcc picks mov), but the case5 clamp limits are placeholders. The dead g!=0 arm must still be emitted (g from data, not folded). Re-fetch full pool before matching.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02092b48 (main, class D, MED tier) — EUR .s front-load.
 * UNVERIFIED + ITERATION-EXPECTED: jump-table switch + clamp arithmetic.
 *   recipe:     CLASS D branch-table: switch 0..6 returning constants; case6(.L_17c) = clamp computed via cmp/movcc + signed sub if-assign; mov-immediates 0x2700000/0x2000000 are MOV not LDR
 *   risk:       see header below
 * func_02092b48(sel): sibling of 02092a5c with a clamped case.
 *   case1 -> 0x023e0000
 *   case3(.L_12c) -> if(data_021a662c==0) return 0;
 *                    else if((func_02092368()&3)==1) return 0; else return 0x2700000;
 *   case4 -> 0x2000000 (mov imm)
 *   case5(.L_17c): base=data_027e0000; g=0; lim2=_LIT4;
 *        top = base+0x3f80; t = top - lim2;
 *        if (g==0) { lo=_LIT5; return base<lo ? lo : base; }
 *        else if (g<0)  return _LIT5 - g;      // ldrlt r0,_LIT5; sublt
 *        else           return t - g;
 *      (g is data at _LIT3 == 0 constant, so the !=0 path is dead but emitted.)
 *   case6 -> _LIT6 ; case (last) -> _LIT7. default/2 -> 0.
 * NOTE: only _LIT0.._LIT3 are listed in the batch pool; _LIT4.._LIT7 referenced
 * but their words were truncated from the asm dump — values below are placeholders.
 */

extern int  data_021a662c;
extern int  data_027e0000;
extern int  func_02092368(void);

int func_02092b48(unsigned int sel) {
    switch (sel) {
    case 1:
        return 0x023e0000;
    case 3:
        if (data_021a662c == 0)
            return 0;
        if ((func_02092368() & 0x3) == 1)
            return 0;
        return 0x2700000;
    case 4:
        return 0x2000000;
    case 5: {
        int base = (int)&data_027e0000;
        int g = 0;            /* _LIT3 == 0x00000000 */
        int lim2 = 0x027ff000 /* _LIT4 placeholder */;
        int lo   = 0x027e0000 /* _LIT5 placeholder */;
        int top  = base + 0x3f80;
        int t    = top - lim2;
        if (g == 0) {
            if (base < lo)
                base = lo;
            return base;
        }
        if (g < 0)
            return lo - g;
        return t - g;
    }
    case 6:
        return 0x027ff000 /* _LIT6 placeholder */;
    default:
        return 0;
    }
}
