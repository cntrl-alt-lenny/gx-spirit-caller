/* func_0203192c: write u32 at data_0219adb8+0xc.
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085d4` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_0219adb8[];

void func_0203192c(void *p) {
    *(void **)(data_0219adb8 + 0xc) = p;
}
