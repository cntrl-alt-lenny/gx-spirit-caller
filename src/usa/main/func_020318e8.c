/* func_020318e8: write u32 at data_0219acd8+0x10.
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085b8` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_0219acd8[];

void func_020318e8(void *p) {
    *(void **)(data_0219acd8 + 0x10) = p;
}
