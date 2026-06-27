/* CAMPAIGN-PREP candidate for func_02205b30 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     f2 :2 / f4 :9 / d0250 :13 bitfields; handle=f14>>3; signed high-byte extract; stride-4 array
 *   risk:       permuter-class: parked .s. The high-byte read is lsl16;lsr16;ASR8;and#0xff — (u16) then SIGNED >>8; mwcc likely emits lsr (unsigned) or drops the u16 step. Needs real 021b947c return type / hand-.s.
 *   confidence: low
 */
/* func_ov002_02205b30: cls D — gate f2 bits12-13==2; handle=f14>>3; 021b947c(handle);
 * ((u16)r >> 8 & 0xff)==0xf; if handle==f4:9 then require f0 == d0250[handle].id13.
 * NOTE: parked .s (brief 302). Orig extracts the high byte with lsl16;lsr16;ASR8. */
typedef unsigned short u16;
struct F2_05b30 { u16 bit0:1; u16 pad:11; u16 b12_13:2; u16 top:2; };
struct F4_05b30 { u16 pad6:6; u16 b6_14:9; u16 top:1; };
struct S05b30 { u16 f0; struct F2_05b30 f2; struct F4_05b30 f4; u16 pad6_13[7]; unsigned int f14; };
struct D0250 { u16 id13:13; u16 top:3; u16 pad; };
extern struct D0250 data_ov002_022d0250[];
extern int func_ov002_021b947c(int handle);
int func_ov002_02205b30(struct S05b30 *self) {
    int handle;
    int r;
    if (self->f2.b12_13 != 2) return 0;
    handle = self->f14 >> 3;
    r = func_ov002_021b947c(handle);
    if ((((short)(u16)r >> 8) & 0xff) != 0xf) return 0;
    if (handle == self->f4.b6_14) {
        if (self->f0 != data_ov002_022d0250[handle].id13) return 0;
    }
    return 1;
}
