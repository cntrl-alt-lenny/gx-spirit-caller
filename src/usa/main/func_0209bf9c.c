/* func_0209bf9c: write u32 at data_021a837c+0x0.
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085b8` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_021a837c[];

void func_0209bf9c(void *p) {
    *(void **)data_021a837c = p;
}
