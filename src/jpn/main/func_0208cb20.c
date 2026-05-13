/* func_0208cb20: read u16 at data_021a6224+0xe.
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085b8` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_021a6224[];

unsigned int func_0208cb20(void) {
    return *(unsigned short *)(data_021a6224 + 0xe);
}
