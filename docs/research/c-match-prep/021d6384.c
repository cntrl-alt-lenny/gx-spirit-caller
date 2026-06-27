/* CAMPAIGN-PREP candidate for func_021d6384 (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind b500 (r4) and e500 (r2) across multiple uses; reload 021040ac per store (orig has 2 ldr =sym); mla index inlined (idx*0x1a)
 *   risk:       reshape-able/permuter-class: orig RELOADS data_021040ac base twice (two ldr =sym) but mwcc CSEs the pooled address to one reg -> one fewer pool load; the ldreqh/ldrneh select on b500.4c==1 may also flip cc.
 *   confidence: low
 */
/* func_ov004_021d6384: linear init. Copy a 0x54 record (02094688), latch a byte
 * data_02104c78[arg0] from e500.unkce4, mirror e500.unkd18 -> 021040ac.ba8, pick a
 * u16 from b500+0x3d14/16 by b500.unk4c==1 -> 021040ac.ba4, then 020aadf8 with an
 * mla index (arg0*0x1a + data_02104c7a) and store 02007218() -> b500.unk3ce0. */
#include "ov004_core.h"
extern char data_021040ac[];
extern char data_02104c78[];
extern char data_02104c7a[];
extern char data_ov004_0220f1d4[];
extern int  func_02007218(void);
extern void func_02094688(void *src, void *dst, int n);
extern void func_020aadf8(void *a, void *b);

void func_ov004_021d6384(int idx, int arg1) {
    char *b = data_ov004_0220b500;
    char *e = data_ov004_0220e500;
    unsigned short sel;
    func_02094688((char *)0 + arg1 + 2, data_ov004_0220f1d4, 0x54);
    data_02104c78[idx] = e[0xce4];
    *(int *)(data_021040ac + 0xba8) = *(int *)(e + 0xd18);
    if (*(int *)(b + 0x4c) == 1)
        sel = *(unsigned short *)(b + 0x3d16);
    else
        sel = *(unsigned short *)(b + 0x3d14);
    *(int *)(data_021040ac + 0xba4) = sel;
    func_020aadf8(data_02104c7a + idx * 0x1a, b + 0x3ce5);
    *(int *)(b + 0x3ce0) = func_02007218();
}
