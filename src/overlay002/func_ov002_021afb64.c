/* func_ov002_021afb64: write u32 at data_ov002_022cdc78+0x8.
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085d4` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_ov002_022cdc78[];

void func_ov002_021afb64(void *p) {
    *(void **)(data_ov002_022cdc78 + 0x8) = p;
}
