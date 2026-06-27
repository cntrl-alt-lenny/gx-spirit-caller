/* CAMPAIGN-PREP candidate for func_021ee44c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     do/while(--n>=0) with bmi pre-guard; (f494+n)&0x7F u16 index; self-recursion
 *   risk:       loop lowering: orig is bmi-guard + body + subs;bpl bottom-test with a fall-through `else if (v==limit)`. mwcc may reorder the v<limit vs v==limit branches or hoist base.f494. reshape-able via do/while + continue/else shape; index masking is struct-guessed (arr498 offset).
 *   confidence: med
 */
/* func_ov002_021ee44c (ov002, class C). Recursive descending scan. args r0=n, r1=limit.
 * Reads u16 arr at base+0x498 indexed by (base.f494 + n) & 0x7F (the lsl#25;lsr#24 = (x&0x7F)*2
 * applied to a u16 stride). Descends n while n>=0; recurses on (n-1, limit-v) when v<limit. */

struct g_t { char _pad[0x494]; int f494; unsigned short arr498[0x80]; };

extern struct g_t data_ov002_022ce288;

int func_ov002_021ee44c(int n, int limit) {
    if (n >= 0) {
        do {
            int v = data_ov002_022ce288.arr498[(data_ov002_022ce288.f494 + n) & 0x7F];
            if (v < limit) {
                if (n != 0 && func_ov002_021ee44c(n - 1, limit - v) != 0)
                    return 1;
            } else if (v == limit) {
                return 1;
            }
        } while (--n >= 0);
    }
    return limit == 0 ? 1 : 0;
}
