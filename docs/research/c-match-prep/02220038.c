/* CAMPAIGN-PREP candidate for func_02220038 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     per-player 0x868 mla slot; asymmetric-shift field compare; ==const gate; stack-passed (u16) 5th arg
 *   risk:       021d59cc arg shape (5 args, which regs r1/r2 hold f1 vs the cf1a4 value at call) and slot-word field offsets are struct-guessed; mul-by-1000 then (u16) trunc must stay. struct-guessed.
 *   confidence: low
 */
/* func_ov002_02220038: per-player (0x868) slot lookup + bitfield equality guard
 * + cf1a4 gate, then a const-compare/divmod-ish pack into 021d59cc (cls D).
 * slot read 32-bit; asymmetric shift fields; self->f0==0x1835 gates n=f12*1000.
 * 5th arg ((u16)n) passed on the stack. r3 (bit0) reused as cf1a4 byte index. */
typedef unsigned int   u32;
typedef unsigned short u16;
struct Self { u16 f0; u16 b0 : 1; u16 f1 : 5; u16 : 0; u16 f4; u16 : 16; u16 : 16; u16 f12; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_021d59cc(int a, int b, int c, int d, int e);
int func_ov002_02220038(struct Self *self) {
    int flag = self->b0 & 1;
    int v = *(int *)(data_ov002_022cf16c + flag * 0x868 + self->f1 * 0x14 + 0x30);
    int lhs = (u32)(self->f4 << 17) >> 23;
    int rhs = (((u32)(v << 2) >> 24) << 1) + ((u32)(v << 18) >> 31);
    int n;
    if (lhs != rhs)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + flag * 0x868 + flag) == 0)
        return 0;
    n = 0;
    if (self->f0 == 0x1835)
        n = self->f12 * 1000;
    func_ov002_021d59cc(flag, self->f1, *(u16 *)(data_ov002_022cf1a4 + flag * 0x868 + flag),
        3, (u16)n);
    return 0;
}
