/* CAMPAIGN-PREP candidate for func_022128a4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: :1/:2 bitfields (lsl;lsr) at bit2/bit12/bit23; bit0 reload at L_50c; if/else fallthrough.
 *   risk:       struct-guessed: bit positions (bit12 :2, bit23 :1 in +0x14 word) inferred from shift amounts; confirm field offsets/widths against real struct. Codegen byte-verified.
 *   confidence: high
 */
/* func_ov002_022128a4 (ov002, cls D): bit2 guard, :2 field@bit12 dispatch,
 * two arg-pack-ish calls with constant payloads (3000 / 5000). */
typedef unsigned short u16;
typedef unsigned int   u32;

struct S022128a4 {
    u16 f0;                 /* +0 */
    u16 b0    : 1;          /* +2 bit0  */
    u16       : 11;
    u16 f12   : 2;          /* +2 bits12-13 ((hw>>12)&3) */
    u16       : 2;
    u16 b2_2  : 2;          /* +4 bits0-1 (pad) */
    u16 b2    : 1;          /* +4 bit2  ((hw>>2)&1) */
    u16       : 13;
    char _pad6[0x14 - 6];   /* +6 .. +0x14 */
    u32 f14_lo : 23;        /* +0x14 bits0-22 */
    u32 f14_23 : 1;         /* +0x14 bit23 ((w>>23)&1) */
    u32        : 8;
};

extern void func_ov002_021df7cc(int bit0, int v);
extern void func_ov002_021e05fc(int bit0, u16 v);

int func_ov002_022128a4(struct S022128a4 *self) {
    if (self->b2) return 0;
    if (self->f12 == 2) {
        if (self->f14_23) {
            func_ov002_021e05fc(self->b0, 3000);
        }
        func_ov002_021df7cc(self->b0, 5000);
    } else {
        func_ov002_021e05fc(self->b0, 3000);
    }
    return 0;
}
