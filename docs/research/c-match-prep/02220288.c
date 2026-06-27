/* CAMPAIGN-PREP candidate for func_02220288 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     per-player 0x868 mla slot; asymmetric-shift field compare; const-mul then (u16) trunc; stack 5th arg
 *   risk:       021d59cc arg/reg placement at the call (r0=flag,r1=f1,r2=f0,r3=18,[sp]=(u16)(f8*300)) and slot-word field offsets are struct-guessed; the f8*300 product must (u16)-truncate. struct-guessed.
 *   confidence: low
 */
/* func_ov002_02220288: per-player (0x868) slot lookup + bitfield equality guard
 * + cf1a4 gate, then 021d59cc(flag, f1, self->f0, 18, (u16)(f8*300)) (cls D).
 * slot read 32-bit; asymmetric shift fields; 5th arg ((u16)(f8*300)) on stack.
 * r3 (bit0) reused as the cf1a4 byte index. self stays in ip. */
typedef unsigned int   u32;
typedef unsigned short u16;
struct Self { u16 f0; u16 b0 : 1; u16 f1 : 5; u16 : 0; u16 f4; u16 : 16; u16 f8; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_021d59cc(int a, int b, int c, int d, int e);
int func_ov002_02220288(struct Self *self) {
    int flag = self->b0 & 1;
    int v = *(int *)(data_ov002_022cf16c + flag * 0x868 + self->f1 * 0x14 + 0x30);
    int lhs = (u32)(self->f4 << 17) >> 23;
    int rhs = (((u32)(v << 2) >> 24) << 1) + ((u32)(v << 18) >> 31);
    if (lhs != rhs)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + flag * 0x868 + flag) == 0)
        return 0;
    func_ov002_021d59cc(flag, self->f1, self->f0, 0x12, (u16)(self->f8 * 0x12c));
    return 0;
}
