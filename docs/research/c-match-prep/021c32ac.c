/* CAMPAIGN-PREP candidate for func_021c32ac (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind mla base to one local, call-order=source, signed s16 field reads
 *   risk:       struct-guessed (data_021cdf88 stride 0x1c + field offsets inferred); also the (*pG!=0)?0xc9:0xe9 flag uses double-cmp/movne-moveq normalize — if mwcc skips the bool temp the cmp pair diverges. permuter-class for that.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov006_021c32ac (ov006, class D) — brief 494.
 * UNVERIFIED build-free draft. mla struct-base + field-store setter.
 * row = &data_021cdf88[sel] with stride 0x1c (mla r4,sel,#0x1c,base) — BIND base
 * (held in r4 across 4 ldrsh reads). handle = func_02021660(self->f0,5,8).
 * guard reads self->f68 BEFORE r5 reused for handle. flag = (*pG!=0)?0xc9:0xe9.
 * recipe: bind mla base (one local), call-order = source order, signed :16 reads.
 */
typedef short s16;
extern int  data_ov006_0225e068;          /* read once */
extern int  func_02021660(int a, int b, int c);
extern void func_020216b0(int handle, int sel, int val);

struct Row32ac { s16 h0; s16 h2; char _4[4]; s16 h8; s16 ha; char _c[0x10]; }; /* stride 0x1c */
extern struct Row32ac data_ov006_021cdf88[];

struct St32ac { int f0; char _4[0x58]; int f5c; int f60; char _64[4]; int f68; };

int func_ov006_021c32ac(struct St32ac *self) {
    struct Row32ac *row = &data_ov006_021cdf88[self->f5c + (self->f60 << 2) + 1];
    int handle = func_02021660(self->f0, 5, 8);
    int flag;
    if (self->f68 != 0) {
        flag = 0xc9;
        if (data_ov006_0225e068 == 0)
            flag |= 0x20;
    } else {
        flag = 0;
    }
    func_020216b0(handle, 3, row->h0 + 0x14);
    func_020216b0(handle, 4, row->h2 + 0x14);
    func_020216b0(handle, 0x11, row->h8);
    func_020216b0(handle, 0x12, row->ha);
    func_020216b0(handle, 0, flag);
    return 1;
}
