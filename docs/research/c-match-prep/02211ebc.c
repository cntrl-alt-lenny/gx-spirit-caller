/* CAMPAIGN-PREP candidate for func_02211ebc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (word4<<29)>>31 :1 guard; stack-out df38; (u16)out>>8 -> lsl16;lsr16;asr8; hi*0x14 -> smulbb; dead-arg twin calls
 *   risk:       Compile-verified near-IDENTICAL: only the masked-hi lands in lr vs orig r2 and the cf1a2 ldr is scheduled 2 insns later. reshape-able (reorder/retype hi to steer r2) but borderline permuter-class reg coin-flip.
 *   confidence: med
 */
typedef unsigned short u16;
struct F02211ebc_F4 { u16 lo : 2; u16 b2 : 1; u16 hi : 13; };
struct F02211ebc_Self { u16 f0; u16 f2; struct F02211ebc_F4 f4; };
extern char data_ov002_022cf1a2[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_0223df38(void *self, int b, int *out);
extern int  func_ov002_021d6808(void *self, int a, int b, int c, int d);
int func_ov002_02211ebc(struct F02211ebc_Self *self) {
    int out;
    int lo, bit0, hi;
    if (self->f4.b2)
        return 0;
    if (func_ov002_0223df38(self, 0, &out) == 0)
        return 0;
    lo = out & 0xff;
    bit0 = lo & 1;
    hi = ((u16)out >> 8) & 0xff;
    if (*(u16 *)(data_ov002_022cf1a2 + bit0 * 0x868 + hi * 0x14) == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + bit0 * 0x868 + hi * 0x14) == 0) {
        func_ov002_021d6808(self, lo, bit0, 1, 1);
    } else {
        func_ov002_021d6808(self, lo, bit0, 0, 1);
    }
    return 0;
}
