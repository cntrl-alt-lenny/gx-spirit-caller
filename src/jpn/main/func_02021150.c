/* func_02021150: indexed-read data_0219426c[i].
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085b8` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_0219426c[];

void *func_02021150(int i) {
    return ((void **)data_0219426c)[i];
}
