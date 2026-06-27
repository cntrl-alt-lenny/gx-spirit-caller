/* CAMPAIGN-PREP candidate for func_021ece34 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: index math+:13 flags hoisted above idx>=5 guard; bind flags once; reuse as 0202e2c8 arg
 *   risk:       orig holds flags in r5 across the range guard and the first call, then passes it to func_0202e2c8; if mwcc reloads or sinks the :13 extract the r5 lifetime diverges. reshape-able (compute+bind flags first).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_021ece34 (ov002, class D, MED tier) — brief 498.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: index math + e->flags :13 computed BEFORE the index>=5 guard (orig hoist, flags bound in r5); flags reused as 2nd-call arg; cf1a4 u16 check
 *   risk:       orig computes flags=field30<<19>>19 into r5 and HOLDS it across 'cmp idx,#5;movge' and down to func_0202e2c8(flags). If mwcc sinks the bitfield past the range guard or reloads it for the call, r5 lifetime diverges. reshape-able (declare/compute e+flags first, bind to one local).
 *   confidence: med
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct CardEnt30 { u32 _pad[12]; u32 flags : 13; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_0202e2c8(int flags);
extern int  func_ov002_021c1ef0(int self, int player, int index);

int func_ov002_021ece34(int self, int player, int index)
{
    int half;
    int row;
    struct CardEnt30 *e;
    int flags;

    half = (player & 1) * 0x868;
    row  = index * 0x14;
    e = (struct CardEnt30 *)(data_ov002_022cf16c + half + row);
    flags = e->flags;

    if (index >= 5)
        return 0;
    if (flags == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + half + row) == 0)
        return 0;
    if (func_ov002_021c1ef0(self, player, index) == 0)
        return 0;
    if (func_0202e2c8(flags) != 0)
        return 1;
    return 0;
}
