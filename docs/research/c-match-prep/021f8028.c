/* CAMPAIGN-PREP candidate for func_021f8028 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (b0&1)*0x868 base + b1*0x14 row -> strh f8; two calls pass (b0,b1) from reloaded halfword
 *   risk:       struct-guessed/fold + reload: (self->b0 & 1) on :1 bitfield drops the orig 'and ip,r2,#1'; also orig reloads [+2] 3x (table+2 calls) but mwcc may CSE to 1 ldrh. Both reshape-able-uncertain (int copy of b0; force reload).
 *   confidence: med
 */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

struct Self {
    u16 f0;
    u16 b0 : 1;
    u16 b1 : 5;
    u16 b6 : 6;
    u16 _r4;
    u16 _r6;
    u16 f8;
};

extern char data_ov002_022cf1a8[];

extern void func_ov002_021e2d94(int a, int b, int c, int d);
extern void func_ov002_021d90c0(int a, int b, int c);

int func_ov002_021f8028(struct Self *self) {
    char *base = data_ov002_022cf1a8 + (self->b0 & 1) * 0x868;
    self->f8 = *(int *)(base + self->b1 * 0x14);
    func_ov002_021e2d94(self->b0, self->b1, 5, 0);
    func_ov002_021d90c0(self->b0, self->b1, 0);
    return 1;
}
