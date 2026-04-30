/* func_0202042c: write u32 at data_02191f40+0xa8.
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085d4` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_02191f40[];

void func_0202042c(void *p) {
    *(void **)(data_02191f40 + 0xa8) = p;
}
