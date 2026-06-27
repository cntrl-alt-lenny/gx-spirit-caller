/* CAMPAIGN-PREP candidate for func_02286a94 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 :1 bitfield; (u16) of 32-bit f14 for lsl16/lsr16; unsigned cmp; stride*0x868
 *   risk:       struct-guessed: offsets 0x2/0x14 inferred. f14 modeled int+(u16) for ldr;lsl16;lsr16 (a u16 member would give ldrh) - confirm 0x14 is a 32-bit field, else reshape the cast.
 *   confidence: med
 */
/* func_ov002_02286a94 (cls D, leaf): table[player]<=u16field ? 1 : (u16field >= 0x5dc)
 * ldrh+lsl#31;lsr#31 => bit0 :1 ; ldr[+0x14]+lsl#16;lsr#16 => (u16) of a 32-bit field;
 * mul#0x868 stride table; sub#0x28c off 0x868 => threshold 0x5dc; unsigned compares (movls/movcs). */
typedef unsigned short u16;
typedef unsigned int u32;
struct S86a94 { u16 f0; u16 bit0:1; u16 rest:15; u32 pad; u32 pad2; u32 pad3; u32 pad4; u32 f14; };
extern char data_ov002_022cf16c[];
int func_ov002_02286a94(struct S86a94 *self) {
    u16 fld = (u16)self->f14;
    u32 tbl = *(u32 *)(data_ov002_022cf16c + (self->bit0 & 1) * 0x868);
    if (tbl <= fld) return 1;
    return fld >= 0x5dc;
}
