/* CAMPAIGN-PREP candidate for func_021ab964 (ov020, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     clone of 021ab8f8 (constants only): scale, pack, fetch via func_0207e638, call func_ov020_021aa8f0 with 8 args
 *   risk:       global field offset 0x96c and the (idx*0x28+0x24)<<12 pack assumed; reg-alloc walled in the original (.s-shipped clone) so byte-match is uncertain
 *   confidence: low
 */
/* func_ov020_021ab964: clone of func_ov020_021ab8f8, constants differ
 * (+0x24 vs +0x23, 0xc000 vs 0xb000, mode 3 vs 2). Scale row index by 0x28,
 * pack (idx*0x28+0x24)<<12 and 0xc000 into the trailing pair, fetch a handle
 * via func_0207e638(g->f96c, 3), then func_ov020_021aa8f0(a1,a2,handle, val,
 * 0, -1, 0xc000, packed).
 */

extern char data_ov020_021ae060[];
extern int  func_0207e638(int a0, int a1);
extern void func_ov020_021aa8f0(int a0, int a1, int handle, int a3,
                                int s0, int s1, int s2, int s3);

void func_ov020_021ab964(int idx, int a1, int a2) {
    int packed;
    int handle;

    packed = (idx * 0x28 + 0x24) << 0xc;
    handle = func_0207e638(*(int *)(data_ov020_021ae060 + 0x96c), 3);
    func_ov020_021aa8f0(a1, a2, handle, 0, 0, -1, 0xc000, packed);
}
