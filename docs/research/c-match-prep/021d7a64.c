/* CAMPAIGN-PREP candidate for func_021d7a64 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     default kind 0xe; guarded ternary; reload base in block, bind p after; 2 zero stack args
 *   risk:       reshape-able (bind/reload): orig recomputes cf16c+pb+0x120 INDEPENDENTLY in the arg2 block vs the post-block r7 bind; mwcc may CSE the two mla bases into one. Stack store-order of the two zero args is store-order-sensitive.
 *   confidence: low
 */
/* func_ov002_021d7a64 (ov002, cls D): notify (02254a2c), optionally pick kind
 * 0xc/0xd from a per-player slot-id query (cf16c + pb + arg1*4 + 0x120), then
 * post via 021d730c (two zeroed stack args), gate on 0202b878==1, finally
 * 021e276c. pb=(arg0&1)*0x868. Default kind 0xe. */
#include "ov002_core.h"

extern int  func_ov002_02254a2c(int a, int b, int c);
extern int  func_ov002_021bb068(int a);
extern int  func_0202e2c8(int id);
extern int  func_0202b878(int id);
extern void func_ov002_021d730c(int a, int *b, int c, int d, int e, int f);
extern void func_ov002_021e276c(int a, int b, int c, int d);

void func_ov002_021d7a64(int arg0, int arg1, int arg2) {
    int pb = (arg0 & 1) * 0x868;
    int kind = 0xe;
    int *p;
    func_ov002_02254a2c(arg0, arg1, arg2);
    if (arg2 != 0 && func_ov002_021bb068(0x19da) != 0) {
        kind = func_0202e2c8(((struct Ov002Slot *)(data_ov002_022cf16c + pb + arg1 * 4 + 0x120))->id)
                   ? 0xc : 0xd;
    }
    p = (int *)(data_ov002_022cf16c + pb + 0x120);
    func_ov002_021d730c(arg0, &p[arg1], 0x1000, kind, 0, 0);
    if (func_0202b878(((struct Ov002Slot *)&p[arg1])->id) != 1)
        return;
    func_ov002_021e276c(arg0, 0x14e2, 2, 0);
}
