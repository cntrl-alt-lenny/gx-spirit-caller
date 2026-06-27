/* CAMPAIGN-PREP candidate for func_021b8fa8 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ldrsh via short[] index; (1<<v); chained != compare (cmp;cmpne); global reload per RMW block; store-order
 *   risk:       reshape-able: the `if(v!=7 && v!=1)` must compile to cmp #7;cmpne #1 (not two branches); if mwcc splits the && into two tests, the predicated orrne block diverges -- a global (not local) REG yields the reload.
 *   confidence: med
 */
/* func_ov006_021b8fa8: v = (s16)tbl[idx]; *(u16*)REG = 1<<v; if (v) { if (v!=7 && v!=1)
 * *REG|=0x4000; *REG|=0x8000; } return 1.  REG is a data cell reloaded per RMW block.
 *
 *   mov r1,r1,lsl#1 ; ldrsh r2,[tbl,r1]  -> signed halfword index
 *   1<<v then strh ; cmp v,0 beq end
 *   cmp v,7 ; cmpne v,1 ; if (ne&ne) |=0x4000
 *   reload REG ; |=0x8000
 */

extern short data_ov006_0224f3e8[];          /* signed-halfword table */
extern unsigned short data_ov006_0224f3e0;   /* state/MMIO-shadow cell */

int func_ov006_021b8fa8(int unused, int idx) {
    int v = data_ov006_0224f3e8[idx];
    data_ov006_0224f3e0 = (unsigned short)(1 << v);
    if (v != 0) {
        if (v != 7 && v != 1) data_ov006_0224f3e0 |= 0x4000;
        data_ov006_0224f3e0 |= 0x8000;
    }
    return 1;
}
