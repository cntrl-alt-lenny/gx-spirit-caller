/* CAMPAIGN-PREP candidate for func_0220ab78 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     gate cmp #2 movcc; reload p; mul b6*0x14; entry bitfield unpack; eq-of-eq bool
 *   risk:       permuter-class: the a==b then r==(a==b) lowers to two cmp/moveq/movne pairs whose reg targets (r0 vs r1) depend on scheduling around the 021bbeac call result; reshape unlikely to pin the moveq/movne order.
 *   confidence: low
 */
/* func_ov002_0220ab78 (ov002, class C, MED) -- batch p_0086.
 * gate cf17c[p] < 2 -> return 0; if global(d016c)->q (+0xcf8)!=0 { 021bae7c(1-p,0x178b,-1); if !=0 return 0 }
 * if cf178[p]!=0 return 0; idx=self->f2.b6*0x14; 021bbeac();
 * entry=*(int*)(cf16c+0x30 + p*0x868 + idx); a = ((entry>>22)&0x3f)<<1 + ((entry<<18)>>31);
 * b = (self->f4>>17)&0x1ff... compare a==b -> r1; final r0(021bbeac ret) == r1 -> bool.
 */
typedef unsigned short u16;
typedef unsigned char  u8;

struct Self0220ab78 {
    u16 f0;
    struct { u16 p : 1; u16 _m : 5; u16 b6 : 6; u16 _t : 4; } f2; /* +0x2 */
    u16 f4;                                                       /* +0x4 */
};
struct Gd016c { u8 _a[0xcf8]; int q; }; /* d016c +0xcf8 */

extern u8 data_ov002_022cf17c[]; /* gate, stride 0x868 */
extern u8 data_ov002_022cf178[]; /* gate, stride 0x868 */
extern u8 data_ov002_022cf16c[]; /* field base, stride 0x868 */
extern struct Gd016c data_ov002_022d016c;
extern int func_ov002_021bae7c(int a, int tag, int x);
extern int func_ov002_021bbeac(void);

int func_ov002_0220ab78(struct Self0220ab78 *self) {
    int p = self->f2.p;
    int idx;
    int r;
    unsigned int entry;
    int a, b;
    if (*(int *)(data_ov002_022cf17c + (p & 1) * 0x868) < 2) return 0;
    if (data_ov002_022d016c.q != 0) {
        if (func_ov002_021bae7c(1 - p, 0x178b, -1) != 0) return 0;
    }
    if (*(int *)(data_ov002_022cf178 + (p & 1) * 0x868) != 0) return 0;
    idx = self->f2.b6 * 0x14;
    r = func_ov002_021bbeac();
    entry = *(unsigned int *)(data_ov002_022cf16c + 0x30 + (p & 1) * 0x868 + idx);
    a = (((entry << 2) >> 24) << 1) + ((entry << 18) >> 31);
    b = (self->f4 << 17) >> 23;
    return r == (a == b);
}
