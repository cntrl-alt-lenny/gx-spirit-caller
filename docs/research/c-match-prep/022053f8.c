/* CAMPAIGN-PREP candidate for func_022053f8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     field6 {6,7} via (u16)(f-6)>1; bitfield b9==b0; unsigned count>0/bcc loop
 *   risk:       f2 held in r4 across range-check + b0 compare (orig 1 ldrh); split bitfield reads -> extra ldrh. f14 offset 0x14 struct-guessed. reshape-able (single f2 local).
 *   confidence: low
 */
/* func_ov002_022053f8: range guard (field6 in {6,7}) + parity/f14.b9
 * compare + 021ff3bc gate, then the counted-helper loop:
 * count0 = T178[player]; for i<T16c[player].f0xc: if helper(f0,i) ret 1.
 * field6 p6 w6 = lsl20;lsr26; f14.b9 p9 w1 = lsl22;lsr31. */
typedef unsigned short u16;
struct F2 { u16 bit0:1; u16 pad1:5; u16 field6:6; u16 rest:4; };
struct F14 { unsigned int pad9:9; unsigned int b9:1; unsigned int hi:22; };
struct S022053f8 { u16 f0; struct F2 f2; unsigned char pad[0x10]; struct F14 f14; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int func_ov002_021ff3bc(struct S022053f8 *self);
extern int func_ov002_022536e8(u16 f0, int i);
int func_ov002_022053f8(struct S022053f8 *self) {
    int i;
    if ((u16)(self->f2.field6 - 6) > 1) return 0;
    if (self->f14.b9 == self->f2.bit0) return 0;
    if (func_ov002_021ff3bc(self) == 0) return 0;
    if (*(unsigned int *)(data_ov002_022cf178 + (self->f2.bit0 & 1) * 0x868) > 0) {
        for (i = 0; i < *(unsigned int *)(data_ov002_022cf16c + (self->f2.bit0 & 1) * 0x868 + 0xc); i++) {
            if (func_ov002_022536e8(self->f0, i) != 0) return 1;
        }
    }
    return 0;
}
