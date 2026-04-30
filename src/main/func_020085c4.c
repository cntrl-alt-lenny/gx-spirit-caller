/* func_020085c4: write u32 at data_02104f3c+0x0.
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085d4` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_02104f3c[];

void func_020085c4(void *p) {
    *(void **)data_02104f3c = p;
}
