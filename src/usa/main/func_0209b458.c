/* func_0209b458: write u32 at data_021a8358+0x20.
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085b8` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_021a8358[];

void func_0209b458(void *p) {
    *(void **)(data_021a8358 + 0x20) = p;
}
