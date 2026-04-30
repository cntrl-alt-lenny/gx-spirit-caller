/* func_0203267c: write u32 at data_0219b2d4+0x0.
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085d4` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_0219b2d4[];

void func_0203267c(void *p) {
    *(void **)data_0219b2d4 = p;
}
