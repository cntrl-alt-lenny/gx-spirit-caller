/* CAMPAIGN-PREP candidate for func_0221d864 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit2 gate; packed lo8/hi8 decode; smulbb slot*0x14; two-table u16 guards; stacked-arg call
 *   risk:       permuter-class: orig holds poff in ip and slot*0x14 (smulbb) in lr ACROSS both table reads, indexing as ldrh[lr, base+poff]; mwcc will compute base+poff+soff per read (1 reg + addressing-mode divergence per access).
 *   confidence: low
 */
/* func_ov002_0221d864 (ov002, class D) — guard on self h4 bit2, resolve a
 * node via 0223df38 + 0223de94 (packed: lo8=a, slot=(u16)v>>8), index two
 * per-player u16 tables cf1a2/cf1a4 at base = (a&1)*0x868 + slot*0x14:
 * require table cf1a2[...]==0 AND cf1a4[...]!=0, then func_021d6808(self,
 * .., 1, 2-on-stack). r0=self. */
#include "ov002_core.h"

extern char data_ov002_022cf1a2[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_021d6808(void *self, int a, int b, int c, int stk);
extern int  func_ov002_0223de94(void *self, int idx);
extern int  func_ov002_0223df38(void *self, int a, int b);

struct Self864 { unsigned short f0; unsigned short f2; unsigned short f4; };

int func_ov002_0221d864(void *self) {
    struct Self864 *s = (struct Self864 *)self;
    int v, a, slot, poff, soff;
    if ((s->f4 >> 2) & 1) return 0;
    if (func_ov002_0223df38(self, 0, 0) == 0) return 0;
    v = func_ov002_0223de94(self, 0);
    a = v & 0xff;
    slot = (((unsigned int)v << 16) >> 16) >> 8;
    poff = (a & 1) * 0x868;
    soff = (slot & 0xff) * 0x14;
    if (*(unsigned short *)(data_ov002_022cf1a2 + poff + soff) != 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + poff + soff) != 0) return 0;
    func_ov002_021d6808(self, 0, 0, 1, 2);
    return 0;
}
