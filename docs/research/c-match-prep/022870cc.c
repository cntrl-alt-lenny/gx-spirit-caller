/* CAMPAIGN-PREP candidate for func_022870cc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 :1; guard>=2; table[bit0]<=0x3e8 (signed ble); (u16)f14 vs 0x5dc threshold
 *   risk:       struct-guessed: f14 at 0x14 modeled as 32-bit + (u16). Note orig computes 0x868-0x28c=0x5dc by reusing the literal 0x868 in r0 (cse) then sub; if mwcc emits a fresh 0x5dc constant the literal-pool differs (reshape-able only if 0x868 happens to stay live).
 *   confidence: med
 */
/* func_ov002_022870cc (cls D): guard 0227da98(bit0)>=2 ? 1 : (table[bit0]<=0x3e8 ? 1 : (0x5dc < (u16)f14)).
 * cmp r0,#2/movge => >=2 early. table[bit0&1] via mul#0x868; cmp #0x3e8/ble. Then sub#0x28c off 0x868=>0x5dc,
 * ldr[+0x14]+lsl16;lsr16 => (u16)f14; cmp 0x5dc, field /bhi => if 0x5dc > field branch to ret0. */
typedef unsigned short u16;
typedef unsigned int u32;
struct S870cc { u16 f0; u16 bit0:1; u16 rest:15; u32 p1; u32 p2; u32 p3; u32 p4; u32 f14; };
extern char data_ov002_022cf16c[];
extern int func_ov002_0227da98(unsigned int bit);
int func_ov002_022870cc(struct S870cc *self) {
    if (func_ov002_0227da98(self->bit0) >= 2) return 1;
    if (*(int *)(data_ov002_022cf16c + (self->bit0 & 1) * 0x868) <= 0x3e8) return 1;
    if (0x5dc <= (u16)self->f14) return 1;
    return 0;
}
