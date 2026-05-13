/* func_0207403c: write u32 at data_0219ee28+0x0.
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085b8` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_0219ee28[];

void func_0207403c(void *p) {
    *(void **)data_0219ee28 = p;
}
