/* func_0202223c: indexed-read data_02198408[i].
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085b8` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_02198408[];

void *func_0202223c(int i) {
    return ((void **)data_02198408)[i];
}
