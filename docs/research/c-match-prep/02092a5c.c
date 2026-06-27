/* CAMPAIGN-PREP candidate for func_02092a5c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     branch-table switch returning ptr constants; case3 gate side-path; case2/default share 0
 *   risk:       reshape-able/struct-guessed: mwcc must emit the `cmp#6;addls pc,pc,sel,lsl#2` dispatch — a dense 0-based switch with the sub-sp/lr frame triggers it. _LIT6 0x037f8000 (.L_b0) is unreferenced by the 7-entry table; if a 7th case (case 7?) is real the table bound is #7 not #6. Verify case count.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02092a5c (main, class D, MED tier) — EUR .s front-load.
 * UNVERIFIED + ITERATION-EXPECTED: jump-table switch returning constants.
 *   recipe:     CLASS D branch-table: switch(sel) over 0..6 returning pointer constants; case2 + default share the 0 fall (b .L_c0 duplicated); case3 has the gate-test side path
 *   risk:       see header below
 * func_02092a5c(sel): region-base lookup.
 *   cmp sel,#6; default(>6 or sel==0||sel==2) -> 0.
 *   sel==1 -> 0x022d2980
 *   sel==3 -> if(data_021a662c==0) return 0;
 *             else if((func_02092368()&3)==1) return 0; else return 0x023e0000;
 *   sel==4 -> 0x01ff8880
 *   sel==5 -> 0x027e0620
 *   sel==6 -> 0x027ff000 ... wait: asm order is .L_30(c1),.L_40(c3),.L_80(c4),.L_90(c5),.L_a0(c6 last=0x037f8000)
 * Re-mapped from the dispatch table:
 *   case 1: _LIT0 0x022d2980
 *   case 3: gate -> 0 or _LIT2 0x023e0000
 *   case 4: _LIT3 0x01ff8880
 *   case 5: _LIT4 0x027e0620
 *   case 6 (one before last branch): _LIT5 0x027ff000
 *   (table has 7 targets: idx0->default, 1->.L_30, 2->default, 3->.L_40,
 *    4->.L_80, 5->.L_90, 6->.L_a0; .L_b0/_LIT6 0x037f8000 is unreached by this
 *    7-entry table — kept as case fallthrough guard, see note).
 */

extern int  data_021a662c;
extern int  func_02092368(void);

int func_02092a5c(unsigned int sel) {
    switch (sel) {
    case 1:
        return 0x022d2980;
    case 3:
        if (data_021a662c == 0)
            return 0;
        if ((func_02092368() & 0x3) == 1)
            return 0;
        return 0x023e0000;
    case 4:
        return 0x01ff8880;
    case 5:
        return 0x027e0620;
    case 6:
        return 0x027ff000;
    default:
        return 0;
    }
}
