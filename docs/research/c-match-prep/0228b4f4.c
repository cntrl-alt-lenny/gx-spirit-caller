/* CAMPAIGN-PREP candidate for func_0228b4f4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: loop bound (u8)f6; per-iter byte-split lo/hi; mla index cf16c+(lo&1)*0x868+hi*0x14; bit-combine via mvn/and/tst; bit0 :1 compare
 *   risk:       deep loop (10 callee-saved regs) + the tst bit-combine: orig schedules ldr/lsr/and/mvn in a fixed weave and the index uses two mla (lo&1)*0x868 / hi*0x14. permuter-class: reg-alloc across the loop body + mla-fusion + lsr/and scheduling won't reshape to byte-exact; struct offsets 0x38/0x40 also guessed.
 *   confidence: low
 */
/* func_ov002_0228b4f4 (ov002, cls D): scan arg1's b6_count entries, match a slot
 * by (b0==self->bit0 && b1_4<=0xa), gate via two callbacks, then a per-player
 * record bit-combine predicate. self=r0/sl, arg1=r1/r9.
 *   if (arg1 == 0) return 0;
 *   n = (u8)arg1->f6;
 *   for (i = 0; i < n; i++) {
 *     pk = func_0223de94(arg1, i); lo = pk & 0xff; hi = ((u16)pk>>8)&0xff;
 *     if (lo != self->bit0) continue;
 *     if (hi > 0xa) continue;
 *     h = func_021b9ecc(lo, hi);
 *     if (func_0202e258() != 0) continue;
 *     if (func_0202e42c(h) == 0) continue;
 *     r = cf16c + (lo & 1)*0x868 + hi*0x14;
 *     a = *(int*)(r + 0x40); b = *(u16*)(r + 0x38);
 *     if ( (b & ~((a>>6)&1)) & ~(((a>>2)|(a>>1)) & 1) ) return 1;
 *   }
 *   return 0;
 */
typedef unsigned short u16;
typedef unsigned char  u8;
struct S0228b4f4 { u16 f0; u16 bit0:1; u16 rest:15; u16 _pad4; u16 f6; };
extern char data_ov002_022cf16c[];
extern u16  func_ov002_0223de94(struct S0228b4f4 *node, int idx);
extern int  func_ov002_021b9ecc(int lo, int hi);
extern int  func_0202e258(void);
extern int  func_0202e42c(int h);
int func_ov002_0228b4f4(struct S0228b4f4 *self, struct S0228b4f4 *arg1) {
    int i, n;
    if (arg1 == 0) return 0;
    n = (u8)arg1->f6;
    for (i = 0; i < n; i++) {
        int pk = func_ov002_0223de94(arg1, i);
        int lo = pk & 0xff;
        int hi = ((u16)pk >> 8) & 0xff;
        int h, a, b;
        char *r;
        if (lo != self->bit0) continue;
        if (hi > 0xa) continue;
        h = func_ov002_021b9ecc(lo, hi);
        if (func_0202e258() != 0) continue;
        if (func_0202e42c(h) == 0) continue;
        r = data_ov002_022cf16c + (lo & 1) * 0x868 + hi * 0x14;
        a = *(int *)(r + 0x40);
        b = *(u16 *)(r + 0x38);
        if ((b & ~((a >> 6) & 1)) & ~(((a >> 2) | (a >> 1)) & 1)) return 1;
    }
    return 0;
}
