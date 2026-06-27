/* CAMPAIGN-PREP candidate for func_020885a0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     init-guard; fn-ptr stores in source order; two separate bic RMW on obj+0x24
 *   risk:       reshape-able: the two bic of obj+0x24 are separate ldr/bic/str (orig reloads between); if mwcc fuses to one &~3, split — keep as two statements (already done). Low residual risk.
 *   confidence: high
 */
/* func_020885a0: one-time init guard (data_021a5134) then store fn ptrs / clear / bic flags
 * into obj @ r0 in source order. */
typedef unsigned int u32;

extern u32 data_021a5134;
extern void *data_021a5138;
extern void func_0207d1b8(void *p, int x);
extern void func_02088000(void);
extern void func_02088070(void);

void func_020885a0(u32 *o) {
    if (data_021a5134 == 0) {
        func_0207d1b8(&data_021a5138, 0);
        data_021a5134 = 1;
    }
    o[2]  = (u32)&func_02088070;    /* obj+0x8 */
    o[3]  = (u32)o;                 /* obj+0xc */
    o[5]  = (u32)&func_02088000;    /* obj+0x14 */
    o[6]  = (u32)o;                 /* obj+0x18 */
    o[0x11] = 0;                    /* obj+0x44 */
    o[0x12] = 0;                    /* obj+0x48 */
    o[9] &= ~1u;                    /* obj+0x24 bic 1 */
    o[9] &= ~2u;                    /* obj+0x24 bic 2 (separate RMW, matches reload) */
}
