/* CAMPAIGN-PREP candidate for func_021c3a6c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :13 bitfield; cmp want,result operand order (cmp r8,r0 addeq); reload row+0xc; count r5/i r4 order
 *   risk:       compare is cmp arg1,result (want first) feeding addeq; if mwcc emits cmp result,want the addeq/movcc dest picks wrong reg -> reg-alloc swap. reshape-able (operand order want==f(x)); else permuter-class coin-flip.
 *   confidence: med
 */
/* func_ov002_021c3a6c: count entries in player(arg0&1) 0x120 array (int*, stride4,
 * len *(row+0xc)) where func_0202b878(:13 id) == arg1. count=cf178[idx]; if 0
 * return 0. id13=(:13) reloaded each iter; compare arg1==result (cmp r8,r0 ->
 * addeq). Bound *(row+0xc) reloaded; i (r4) and count (r5) both 0-init. */
extern char data_ov002_022cf16c[];
extern int  data_ov002_022cf178[];
extern int  func_0202b878(unsigned int id);

struct Ov002Id13 { unsigned int v : 13; };

int func_ov002_021c3a6c(int player, int want) {
    int idx = (player & 1) * 0x868;
    char *row = (char *)data_ov002_022cf16c + idx;
    int *arr = (int *)(row + 0x120);
    int i = 0;
    int count = 0;
    if (*(int *)((char *)data_ov002_022cf178 + idx) == 0)
        return 0;
    do {
        if (want == func_0202b878(((struct Ov002Id13 *)&arr[i])->v))
            count++;
        i++;
    } while ((unsigned)i < (unsigned)*(int *)(row + 0xc));
    return count;
}
