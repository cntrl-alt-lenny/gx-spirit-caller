/* func_02019198: read u16 at data_0210586c+0x52.
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085b8` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_0210586c[];

unsigned int func_02019198(void) {
    return *(unsigned short *)(data_0210586c + 0x52);
}
