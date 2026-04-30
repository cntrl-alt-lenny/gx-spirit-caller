/* func_0209b54c: write u32 at data_021a8438+0x20.
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085d4` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_021a8438[];

void func_0209b54c(void *p) {
    *(void **)(data_021a8438 + 0x20) = p;
}
