/* CAMPAIGN-PREP candidate for func_0227aa50 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT/CLEAR four :8 fields (byte-wise bic) + orr-set halfword
 *   risk:       mwcc may coalesce four :8 zero-stores into one mov#0+str instead of 4 bics; field offsets guessed
 *   confidence: low
 */
/* func_ov002_0227aa50: clear word@+0x18 to 0 (byte-wise bic), then OR 0xc0 into
 * the halfword@+0x16.
 *
 *   ldr r1,[r0,#0x18]; bic ff; bic ff00; bic ff0000; bic ff000000; str       ; =0
 *   ldrh r1,[r0,#0x16]; orr #0xc0; strh                                       ; |=0xc0
 *
 * The 4 separate `bic` (not a single mov #0) come from clearing four :8
 * bitfields; model +0x18 as four byte fields all set to 0.
 */
typedef unsigned int u32;
typedef unsigned short u16;
struct S22aa50 {
    char pad0[0x16];
    u16 f16;                 /* @0x16 */
    u16 pad16;
    u32 b0 : 8;              /* @0x18, four byte sub-fields */
    u32 b1 : 8;
    u32 b2 : 8;
    u32 b3 : 8;
};
extern struct S22aa50 data_ov002_022cd300;

void func_ov002_0227aa50(void) {
    data_ov002_022cd300.b0 = 0;
    data_ov002_022cd300.b1 = 0;
    data_ov002_022cd300.b2 = 0;
    data_ov002_022cd300.b3 = 0;
    data_ov002_022cd300.f16 |= 0xc0;
}
