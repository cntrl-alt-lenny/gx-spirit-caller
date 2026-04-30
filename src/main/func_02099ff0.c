/* func_02099ff0: read u16 at data_021a8394+0xc.
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085d4` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_021a8394[];

unsigned int func_02099ff0(void) {
    return *(unsigned short *)(data_021a8394 + 0xc);
}
