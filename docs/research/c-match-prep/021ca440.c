/* CAMPAIGN-PREP candidate for func_021ca440 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two guard calls; sparse switch (2 cmp cases + 6 contiguous jump-table); case order = source; bool tail
 *   risk:       reshape-able: switch lowering — the bgt/bge binary search over 0x158b/0x160f then `addls pc,pc,r0,lsl#2` table for 0x164a..f. If mwcc emits a compare-chain instead, regroup/reorder cases; case-body order (0x158b first) must stay.
 *   confidence: med
 */
/* func_ov002_021ca440: guard on func_02030808(b)!=0 and func_0203058c(b)==0,
 * then a sparse switch on b. Cases 0x158b/0x160f gate on func_021bb90c(a,b);
 * cases 0x164a..0x164f gate on func_021bb90c(a, func_02031838(b)); both fall
 * through to the tail. Tail returns func_021ca3f0(a,b) != 0. */
extern int func_0203058c(int b);
extern int func_02030808(int b);
extern int func_02031838(int b);
extern int func_ov002_021bb90c(int a, int b);
extern int func_ov002_021ca3f0(int a, int b);

int func_ov002_021ca440(int arg0, int arg1) {
    if (func_02030808(arg1) == 0)
        return 0;
    if (func_0203058c(arg1) != 0)
        return 0;
    switch (arg1) {
    case 0x158b:
    case 0x160f:
        if (func_ov002_021bb90c(arg0, arg1) != 0)
            return 0;
        break;
    case 0x164a: case 0x164b: case 0x164c:
    case 0x164d: case 0x164e: case 0x164f:
        if (func_ov002_021bb90c(arg0, func_02031838(arg1)) == 0)
            return 0;
        break;
    }
    return func_ov002_021ca3f0(arg0, arg1) != 0;
}
