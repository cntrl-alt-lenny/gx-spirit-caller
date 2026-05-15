/* func_020203d8: write u32 at data_02191e60+0xa8.
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085b8` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_02191e60[];

void func_020203d8(void *p) {
    *(void **)(data_02191e60 + 0xa8) = p;
}
