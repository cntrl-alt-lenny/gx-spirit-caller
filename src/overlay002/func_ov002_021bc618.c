/* func_ov002_021bc618: count how many of 5 slots pass a predicate, then
 * clamp the count against a capacity when a global gate is set.
 * Hub: 28 band-callers.
 *
 *   - count = number of i in [0,5) with func_ov002_021bc55c(arg0, i) != 0
 *   - if func_ov002_021bb068(0x16df) != 0:
 *         if (count >= 5 - func_ov002_021bbeac(arg0))
 *             count = 5 - func_ov002_021bbeac(arg0);   // re-evaluated (2 calls)
 *         if (count <= 0) count = 0;
 *   - return count;
 */

extern int func_ov002_021bc55c(int a, int b);
extern int func_ov002_021bb068(int a);
extern int func_ov002_021bbeac(int a);

int func_ov002_021bc618(int arg0) {
    int i;
    int count = 0;
    for (i = 0; i < 5; i++) {
        if (func_ov002_021bc55c(arg0, i) != 0)
            count++;
    }
    if (func_ov002_021bb068(0x16df) != 0) {
        if (count >= 5 - func_ov002_021bbeac(arg0))
            count = 5 - func_ov002_021bbeac(arg0);
        if (count <= 0)
            count = 0;
    }
    return count;
}
