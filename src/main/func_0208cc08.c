/* func_0208cc08: read u16 at data_021a6304+0xe.
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085d4` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_021a6304[];

unsigned int func_0208cc08(void) {
    return *(unsigned short *)(data_021a6304 + 0xe);
}
