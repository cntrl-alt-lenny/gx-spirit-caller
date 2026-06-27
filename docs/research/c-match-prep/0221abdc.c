/* CAMPAIGN-PREP candidate for func_0221abdc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     cd3f4[0]/[0x1c] bound once; slot index+9-bit recon validate; (u16)(f6_11+0xffee)>2 range; (u8)|(u8)<<8 byte-pack; 2 stack args
 *   risk:       permuter-class: ip/lr-heavy reg-alloc — orig threads cd3f4[0],cd3f4[0x1c] (r4,r5), the slot ptr (ip), the +4 field (lr) all live across the index math; mwcc will choose different ip/lr/scratch colouring (this is the note's wall). Slot-decode scheduling also residual. struct-guessed: f6_11=+2 bits6-11.
 *   confidence: low
 */
typedef unsigned short u16;
typedef unsigned char  u8;

struct Self0221abdc {
    u16 id;                                       /* +0 */
    u16 b0 : 1; u16 f5 : 5; u16 f6_11 : 6; u16 : 4;/* +2 */
    u16 : 2; u16 b2 : 1; u16 : 3; u16 f6 : 9;      /* +4: bit2 gate, bits6-14 */
};

extern char data_ov002_022cd3f4[];
extern char data_ov002_022cf16c[];
extern int  func_ov002_021b34f4(int a, int b);
extern void func_ov002_021d5a08(void *self, int a, int b, int packed, int s0, int s1);

int func_ov002_0221abdc(struct Self0221abdc *self) {
    int v0 = *(int *)(data_ov002_022cd3f4 + 0);
    int v1c = *(int *)(data_ov002_022cd3f4 + 0x1c);
    unsigned int slot;
    int recon;
    int packed;
    if (self->b2) return 0;
    slot = *(unsigned int *)(data_ov002_022cf16c + (self->b0 & 1) * 0x868 + 0x30 + self->f5 * 0x14);
    recon = ((slot << 2) >> 0x18 << 1) + ((slot << 0x12) >> 0x1f);
    if (self->f6 != recon) return 0;
    if ((u16)(self->f6_11 + 0xffee) > 2) return 0;
    if (v0 == self->b0) return 0;
    if (func_ov002_021b34f4(v0, v1c) != 0) return 0;
    packed = (u16)((u8)self->b0 | ((u8)self->f5 << 8));
    func_ov002_021d5a08(self, v0, v1c, packed, 7, 0);
    return 0;
}
