/* func_020085a8: write u32 at data_02104e5c+0x0.
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085b8` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_02104e5c[];

void func_020085a8(void *p) {
    *(void **)data_02104e5c = p;
}
