/* CAMPAIGN-PREP candidate for func_020452c4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: switch-returning-constants -> branch-table; case 0 first; early-return on r1==0
 *   risk:       reshape-able: cases 1 and 16 both store 6 but are distinct table slots; if mwcc coalesces equal-body cases the jump table loses entries. Keep all labels distinct (explicit fallthrough groups) so addls table width stays 0x12.
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_020452c4 (main, class D, MED tier).
 * Branch-table switch returning constants. Clean jump-table
 * (addls pc,pc,r0,lsl#2) over cases 0..0x11 each storing a small constant to
 * *r1, then returns the global data_0219dac0. Side effects: if r0!=0 store
 * data_0219dac4 to *r0; if r1==0 return early.
 *   recipe: D switch-returning-constants -> branch-table; case 0 first; cmp r1==0 early-return
 */
typedef int s32;

extern s32 data_0219dac0;   /* mode/state global */
extern s32 data_0219dac4;   /* value written through r0 */

s32 func_020452c4(s32 *r0, s32 *r1)
{
    if (r0 != 0)
        *r0 = data_0219dac4;
    if (r1 == 0)
        return data_0219dac0;

    switch (data_0219dac0) {
    case 0:
    case 1:
    default:
        *r1 = 0;
        break;
    case 2:
    case 3:
    case 4:
    case 5:
    case 9:
        *r1 = 6;
        break;
    case 7:
        *r1 = 3;
        break;
    case 8:
        *r1 = 4;
        break;
    case 11:
    case 12:
    case 13:
    case 14:
        *r1 = 1;
        break;
    case 6:
    case 10:
        *r1 = 7;
        break;
    case 15:
        *r1 = 5;
        break;
    case 16:
        *r1 = 6;
        break;
    case 17:
        *r1 = 2;
        break;
    }
    return data_0219dac0;
}
