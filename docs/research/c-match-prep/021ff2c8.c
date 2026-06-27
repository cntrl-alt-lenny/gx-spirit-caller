/* CAMPAIGN-PREP candidate for func_021ff2c8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     f4.field9/f2.b0 bitfields; ge/lt->movge#1/movlt#0 via ternary on n; (b0&1)*0x868 mul index; table[..]-flag
 *   risk:       reshape-able: orig builds flag with movge/movlt into r3 THEN `sub r0,r0,r3` after the table load — the ternary may instead emit the flag inline or reorder vs the `ldr r0,[r1,r0]`. If diverges, split into `if(n>=0)flag=1;` and force load-before-subtract ordering.
 *   confidence: med
 */
/* func_ov002_021ff2c8 (ov002, class C/D) — 021b9aa8(arg1, f4.field9) ge/lt -> 0/1; subtract
 * that from a per-player 0x868 count-table word indexed by (bit0&1). leaf. */
typedef unsigned short u16;

extern int  data_ov002_022cf178[];   /* per-player table, *0x868/player as bytes */
extern int  func_ov002_021b9aa8(int arg1, unsigned int field9);

struct F021ff2c8_F2 { u16 b0 : 1; u16 rest : 15; };
struct F021ff2c8_F4 { u16 pad6 : 6; u16 field9 : 9; u16 top : 1; };
struct F021ff2c8_Self {
    u16 pad0;
    struct F021ff2c8_F2 f2;
    struct F021ff2c8_F4 f4;
};

int func_ov002_021ff2c8(struct F021ff2c8_Self *self, int arg1) {
    int n = func_ov002_021b9aa8(arg1, self->f4.field9);
    int flag = (n >= 0) ? 1 : 0;
    return *(int *)((char *)data_ov002_022cf178 + (self->f2.b0 & 1) * 0x868) - flag;
}
