/* func_020191cc: read u16 at data_0210594c+0x52.
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085d4` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_0210594c[];

unsigned int func_020191cc(void) {
    return *(unsigned short *)(data_0210594c + 0x52);
}
