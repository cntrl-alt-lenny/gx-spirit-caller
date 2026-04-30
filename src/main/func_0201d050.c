/* func_0201d050: write u32 at data_0218febc+0xc.
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085d4` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_0218febc[];

void func_0201d050(void *p) {
    *(void **)(data_0218febc + 0xc) = p;
}
