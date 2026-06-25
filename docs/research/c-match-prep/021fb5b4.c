/* CAMPAIGN-PREP candidate for func_021fb5b4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     counted i<5 accumulate (addeq); bit0 bitfield; mode bound to r4; shift mask 0x1f<<(bit0<<4)
 *   risk:       orig keeps count in r5 / loop i in r7 / self in r6; the `cmp #0x11; addeq` accumulate must stay branchless. If mwcc colours count differently the addeq vs add+b diverges. reshape-able via if(...)count++ (already used).
 *   confidence: med
 */
/* func_ov002_021fb5b4 (ov002, cls C): guard 0220cdd4() then 021f4a84(self,arg1)
 * -> mode r4; if mode==1, count over i=0..4 how many 021c8940(bit0,i) == 0x11,
 * store the count to self->f8, then 021deb84(self, 0x1f << (bit0<<4)); return
 * mode. Clean counted accumulate loop. */

typedef unsigned short u16;

struct Self21fb5b4 { u16 f0; u16 b0 : 1; u16 : 15; u16 f8; };

extern int  func_ov002_0220cdd4(void);
extern int  func_ov002_021f4a84(struct Self21fb5b4 *self, int arg1);
extern int  func_ov002_021c8940(int bit0, int i);
extern void func_ov002_021deb84(struct Self21fb5b4 *self, int mask);

int func_ov002_021fb5b4(struct Self21fb5b4 *self, int arg1) {
    int mode;
    if (func_ov002_0220cdd4() == 0) return -1;
    mode = func_ov002_021f4a84(self, arg1);
    if (mode == 1) {
        int count = 0;
        int i;
        for (i = 0; i < 5; i++) {
            if (func_ov002_021c8940(self->b0, i) == 0x11)
                count++;
        }
        self->f8 = (u16)count;
        func_ov002_021deb84(self, 0x1f << (self->b0 << 4));
    }
    return mode;
}
