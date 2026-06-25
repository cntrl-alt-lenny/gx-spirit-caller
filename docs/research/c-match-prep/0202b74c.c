/* CAMPAIGN-PREP candidate for func_0202b74c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if(id==0) early -1; for(i=1;i<n;i++) so guard=cmp/ble, body cmp+bne; pass i to callee
 *   risk:       reshape-able (decl-order/loop-shape): func_0202b0e0 must receive the live loop index i (asm leaves r0=i at the bl). If mwcc spills i or reorders ret/list decls, the index reg or the i=1 start diverges -- keep i as the controlling var, declare list before ret.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0202b74c (main, class C) -- batch p_0011.
 * UNVERIFIED build-free draft. Lookup: if id==0 return -1. Acquire list via func_02006c0c,
 * scan entries[1..count) for a matching id, on hit ret = func_0202b0e0(i). Then if list!=0
 * Task_InvokeLocked(list). Return ret.  r6=id, r4=ret(-1 init), r5=list.
 */
extern void Task_InvokeLocked(void *list);
extern int  data_020b4768[];
extern char data_020c6a88[];
extern int  func_02006c0c(void *a, int b, int c);
extern int  func_0202b0e0(int idx);

int func_0202b74c(int id) {
    int *list;
    int ret;
    int n;
    int i;
    if (id == 0)
        return -1;
    ret = -1;
    list = (int *)func_02006c0c(data_020c6a88, 4, 0);
    n = data_020b4768[0];
    for (i = 1; i < n; i++) {
        if (id == list[i]) {
            ret = func_0202b0e0(i);
            break;
        }
    }
    if (list != 0)
        Task_InvokeLocked(list);
    return ret;
}
