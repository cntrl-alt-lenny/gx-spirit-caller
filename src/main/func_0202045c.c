/* func_0202045c: read u16 at data_02191f40+0xa.
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085d4` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_02191f40[];

unsigned int func_0202045c(void) {
    return *(unsigned short *)(data_02191f40 + 0xa);
}
