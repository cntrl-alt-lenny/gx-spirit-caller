/* CAMPAIGN-PREP candidate for func_021b9b64 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: shift-pair halfword/byte extracts; 0x1000 if-return; forward call
 *   risk:       arg1=(v>>8)&0xff goes through low-halfword temp (3 ops via r2) not direct lsr#8;and; if mwcc picks direct path one mov diverges. reshape-able (force u16 temp first)
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_021b9b64 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * Drop into src/, run ninja + objdiff, apply the risk note below.
 *   recipe:   CLASS D: halfword/byte field extracts via shift-pairs; sentinel 0x1000 as if-return; forward call with byte0/byte1/highhalf args in source order.
 *   risk:     arg1 = (v>>8)&0xff is computed by the orig through the LOW-halfword temp (lsl#16;lsr#16 then asr#8;and#0xff = 3 ops via r2), not a direct lsr#8;and#0xff; if mwcc takes the 2-op direct path the byte1 extract diverges by one mov. reshape-able (force the low-halfword temp: t=(u16)v; arg1=(t>>8)&0xff).
 *   confidence: med
 */
/* func_ov002_021b9b64: v = func_021b947c(); if (v==0x1000) return 0;
 * return func_021c93f0(v&0xff, (v>>8)&0xff, (unsigned short)(v>>16)). */
typedef unsigned short u16;

extern int func_ov002_021b947c(void);
extern int func_ov002_021c93f0(int b0, int b1, int hi);

int func_ov002_021b9b64(void) {
    int v = func_ov002_021b947c();
    if (v == 0x1000)
        return 0;
    {
        u16 lo = (u16)v;                 /* lsl#16;lsr#16 -> r2 */
        int b1 = ((int)lo >> 8) & 0xff;   /* asr#8 ; and#0xff */
        u16 hi = (u16)(v >> 16);          /* lsr#16 ; (re)lsl#16;lsr#16 */
        int b0 = v & 0xff;
        return func_ov002_021c93f0(b0, b1, (int)hi);
    }
}
