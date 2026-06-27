/* CAMPAIGN-PREP candidate for func_0220cdd4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     kind2:2 bitfield; per-call b0 reload; asym 9-bit raw shift on f4; movs r5 flag reuse; >0 ternary
 *   risk:       permuter-class: single-return inline-vs-branch. Verified-compiled near-identical EXCEPT `if(r5==0)return 0` emits moveq;popeq where orig `beq .L_90` (reuses movs flags as branch). One sharer only, so goto lever cannot convert.
 *   confidence: med
 */
typedef unsigned short u16;
typedef unsigned int   u32;

/* self: u16 at +0 (f0), u16 at +2 (player bit0, 2-bit kind2 at [12:13]),
 * u16 at +4 (a 9-bit field at [6:14]). */
struct SelfCdd4 {
    u16 f0;            /* +0 */
    u16 b0    : 1;     /* +2 [0]     player (lsl#31;lsr#31)    */
    u16       : 11;
    u16 kind2 : 2;     /* +2 [12:13] (lsl#18;lsr#30)          */
    u16       : 2;
    u16 f4;            /* +4 (9-bit field via raw asym shift) */
};

extern int func_ov002_021ca2b8(int player);
extern int func_ov002_021c3ae4(int player, int f0);
extern int func_ov002_021bcd80(int player, int x);
extern int func_ov002_021bbf50(int player);
extern int func_ov002_021b422c(int field, int f0);

int func_ov002_0220cdd4(struct SelfCdd4 *self) {
    int r5;
    if (self->kind2 == 2) {
        if (func_ov002_021ca2b8(self->b0) == 0)
            return 0;
        if (func_ov002_021c3ae4(self->b0, self->f0) == 0)
            return 0;
        r5 = func_ov002_021bcd80(self->b0, -1);
        if (r5 == 0)
            return 0;
        return (r5 == func_ov002_021bbf50(self->b0)) ? 1 : 0;
    }
    return func_ov002_021b422c((u32)(self->f4 << 0x11) >> 0x17, self->f0) > 0 ? 1 : 0;
}
