/* CAMPAIGN-PREP candidate for func_0221a140 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit2 gate; +6 hi-byte==1; nested call; movs/bmi signed r>=0; held base=cf16c+...+0x418; (b0&1) and (u16)recon casts applied
 *   risk:       permuter-class (REDUCED to ~5-insn residual): I VERIFIED that `& 1` on the index (restores `and r2,r1,#1`) and `(u16)recon` arg-cast (restores `<<16>>16`) both close vs the shipped .s. Only the slot-decode reg-threading remains a scheduling coin-flip (orig single-reg accumulator vs mwcc 2-reg split).
 *   confidence: med
 */
typedef unsigned short u16;

struct Self0221a140 {
    u16 id;                 /* +0 */
    u16 b0 : 1; u16 : 15;   /* +2 */
    u16 : 2; u16 b2 : 1;    /* +4 bit2 */
    u16 : 8; u16 f6hi : 8;  /* +6 high byte */
};

extern char data_ov002_022cf16c[];
extern int  func_ov002_021b99b4(int player, int v);
extern void func_ov002_021d8010(void *self, int player, int *p);
extern void func_ov002_021e276c(int player, int id, int a, int b);
extern int  func_ov002_0223def4(int a);

int func_ov002_0221a140(struct Self0221a140 *self) {
    int r;
    int *base;
    unsigned int slot;
    int recon;
    if (self->b2) return 0;
    if (self->f6hi != 1) return 0;
    r = func_ov002_021b99b4(1 - self->b0, func_ov002_0223def4(0));
    if (r < 0) return 0;
    base = (int *)(data_ov002_022cf16c + ((1 - self->b0) & 1) * 0x868 + 0x18 + 0x400);
    func_ov002_021d8010(self, 1 - self->b0, base + r);
    slot = (unsigned int)base[r];
    recon = ((slot << 2) >> 0x18 << 1) + ((slot << 0x12) >> 0x1f);
    func_ov002_021e276c(self->b0, self->id, 1, (u16)recon);
    return 0;
}
