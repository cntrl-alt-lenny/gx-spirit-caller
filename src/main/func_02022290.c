/* func_02022290: indexed-read data_021984e8[i].
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085d4` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_021984e8[];

void *func_02022290(int i) {
    return ((void **)data_021984e8)[i];
}
