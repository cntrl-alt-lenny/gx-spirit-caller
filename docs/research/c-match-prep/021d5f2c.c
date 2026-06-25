/* CAMPAIGN-PREP candidate for func_021d5f2c (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     byte-unpack arg0 (signed >>8), sentinel branch on 0xffff, chained sink calls
 *   risk:       heavy callee-saved holder allocation (r5-r9) for the unpacked bytes; this is the reg-mirror/reg-alloc class flagged as a wall — likely 1-2 regs off
 *   confidence: low
 */
/* func_ov002_021d5f2c: split arg0 into lo/hi bytes, resolve via func_021b3618;
 * if it is the 0xffff sentinel use tag 10, else derive a new lo/hi, compute a
 * tag via func_021b34f4 and replay func_021d5ab4, then dispatch func_021d5d58. */
extern int func_ov002_021b3618(int lo, int hi);
extern int func_ov002_021b34f4(int a, int b, int c, int d);
extern void func_ov002_021d5ab4(int a, int b, int packed, int flag);
extern void func_ov002_021d5d58(int a, int b, int c, int d);

void func_ov002_021d5f2c(int arg0, int arg1) {
    int lo = arg0 & 0xff;
    int hi = (arg0 >> 8) & 0xff;
    int tag;
    int r = func_ov002_021b3618(lo, hi);
    if (r == 0xffff) {
        tag = 10;
    } else {
        int lo2 = r & 0xff;
        int hi2 = (r >> 8) & 0xff;
        tag = func_ov002_021b34f4(lo2, hi2, lo, hi);
        func_ov002_021d5ab4(lo2, hi2, arg0, 1);
    }
    func_ov002_021d5d58(lo, arg0, arg1, tag);
}
