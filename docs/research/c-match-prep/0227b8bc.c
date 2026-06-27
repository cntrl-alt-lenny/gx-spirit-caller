/* CAMPAIGN-PREP candidate for func_0227b8bc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: range-membership switch (7 ids) so mwcc rebuilds the balanced cmp bgt/bge tree; guard call first
 *   risk:       mwcc must reproduce the exact binary-search tree with the orig's delta-encoded compares (e.g. 0x13e8-0xab, -0x78); a switch usually lays the same tree but case ORDER / threshold pivots can shift one bge<->bgt. reshape-able (reorder cases / split into nested ifs to steer pivots).
 *   confidence: med
 */
/* func_ov002_0227b8bc (ov002, class D) — membership test. Calls 0202f9e8(arg0);
 * if nonzero return 1, else return 1 iff arg0 is one of seven specific ids,
 * else 0. The orig is a balanced signed cmp tree (bgt/bge) over the case set
 * { 0x1286, 0x133d, 0x1370, 0x13e8, 0x1476, 0x152e, 0x19bd } — model as switch. */
extern int func_0202f9e8(int a);

int func_ov002_0227b8bc(int a)
{
    if (func_0202f9e8(a) != 0)
        return 1;
    switch (a) {
    case 0x1286:
    case 0x133d:
    case 0x1370:
    case 0x13e8:
    case 0x1476:
    case 0x152e:
    case 0x19bd:
        return 1;
    }
    return 0;
}
