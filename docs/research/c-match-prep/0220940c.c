/* CAMPAIGN-PREP candidate for func_0220940c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     raw-halfword decode for reg-alloc; mla row base; tag6 dispatch ladder
 *   risk:       permuter-class: heavy reg-alloc on the early block (lr/ip/r6 hold base, b6_10*20 product, h2) - mwcc decl-order may rotate registers vs the orig's lr/ip choices. Row field boundaries also struct-guessed.
 *   confidence: low
 */
/* func_ov002_0220940c: row-packed-field guard then tag6 dispatch. Reads row at
 * (bit0)'s cf16c table, +0x30, indexed by f2.b6_10*20; compares packed
 * (b22field*2+bit13) to f4.field9 -> mismatch returns 0. tag6==0x19 ->
 * func_ov002_021b9e00()<5; else 021b4098 gate, re-decode, 021b9e00>=5 then
 * forward to func_ov002_02208bfc(self,arg1). */
typedef unsigned short u16;

struct F0220940c_F2 { u16 bit0 : 1; u16 pad5 : 5; u16 b6_10 : 5; u16 tag6hi : 1; u16 rest : 4; };
struct F0220940c_F4 { u16 pad6 : 6; u16 field9 : 9; u16 top : 1; };
struct F0220940c_Self { u16 f0; struct F0220940c_F2 f2; struct F0220940c_F4 f4; };
struct Row0220940c { unsigned int b0_21 : 22; unsigned int field6 : 8; unsigned int hi : 2; };

extern char data_ov002_022cf16c[];
extern int func_ov002_021b4098(int player, int row, int code);
extern int func_ov002_021b9e00(int player, int row);
extern int func_ov002_02208bfc(struct F0220940c_Self *self, int arg1);

int func_ov002_0220940c(struct F0220940c_Self *self, int arg1) {
    u16 h2 = *(u16 *)((char *)self + 2);
    int tag6 = (h2 << 20) >> 26 & 0x3f;
    int b6_10 = (h2 << 26) >> 27 & 0x1f;
    int bit0 = h2 & 1;
    struct Row0220940c *r = (struct Row0220940c *)
        (data_ov002_022cf16c + bit0 * 0x868 + 0x30 + b6_10 * 20);
    if ((unsigned int)(r->field6 * 2 + (r->b0_21 >> 13 & 1)) != self->f4.field9)
        return 0;
    if (tag6 == 0x19)
        return func_ov002_021b9e00(bit0, b6_10) < 5;
    if (func_ov002_021b4098(bit0, b6_10, 0x181a) == 0)
        return 0;
    if (func_ov002_021b9e00(bit0, b6_10) < 5)
        return 0;
    return func_ov002_02208bfc(self, arg1);
}
