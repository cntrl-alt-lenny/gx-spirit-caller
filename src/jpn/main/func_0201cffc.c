/* func_0201cffc: write u32 at data_0218fddc+0xc.
 *
 * 3-insn 0x10 sibling of brief 017's `func_020085b8` cluster, but a
 * different SHAPE than the load+offset template — see PR #247 for
 * the cluster shape-discrimination intel.
 */

extern char data_0218fddc[];

void func_0201cffc(void *p) {
    *(void **)(data_0218fddc + 0xc) = p;
}
