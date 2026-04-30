/* func_020211a4: indexed-read data_0219434c[i].
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085d4` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_0219434c[];

void *func_020211a4(int i) {
    return ((void **)data_0219434c)[i];
}
