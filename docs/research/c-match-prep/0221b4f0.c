/* CAMPAIGN-PREP candidate for func_0221b4f0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     02202680 1-arg gate; asymmetric field9 raw shift; bit0 bitfield; mla base + r4*4 pointer arg
 *   risk:       orig builds the 0227adb8 ptr as `mla; add#0x18; add#0x400; add r4,lsl#2`; mwcc may fold 0x18+0x400 to one `add#0x418` (encodable) -> 1 fewer insn. reshape-able (split the constant) — or permuter on `mla` vs `mul;add`.
 *   confidence: med
 */
/* func_ov002_0221b4f0 (cls D): 02202680 gate; classify via 021d5a6c(field9,
 * f0, 5, 0); 021b99b4(bit0, field9) -> r4, bail if <0; 021c33e4(bit0,bit0,r4)
 * gate; then 0227adb8(bit0, &cf16c[player][0x418 + r4], 1, 1). */
typedef unsigned short u16;
struct Self { u16 f0; u16 b0 : 1; u16 _r : 15; };

extern char data_ov002_022cf16c[];

extern int  func_ov002_021b99b4(unsigned int bit, unsigned int field9);
extern int  func_ov002_021c33e4(int a, int b, int c);
extern int  func_ov002_021d5a6c(int a, int b, int c, int d);
extern int  func_ov002_02202680(void *self, int arg1);
extern int  func_ov002_0227adb8(int a, int b, int c, int d);

int func_ov002_0221b4f0(struct Self *self) {
    int bit, r4;
    if (func_ov002_02202680(self, 0) == 0) return 0;
    func_ov002_021d5a6c((unsigned)(*(u16 *)((char *)self + 4) << 17) >> 23,
                        *(u16 *)self, 5, 0);
    r4 = func_ov002_021b99b4(self->b0 & 1,
                             (unsigned)(*(u16 *)((char *)self + 4) << 17) >> 23);
    if (r4 < 0) return 0;
    bit = self->b0 & 1;
    if (func_ov002_021c33e4(bit, bit, r4) == 0) return 0;
    bit = self->b0 & 1;
    func_ov002_0227adb8(bit,
        (int)(data_ov002_022cf16c + bit * 0x868 + 0x418) + (r4 << 2),
        1, 1);
    return 0;
}
