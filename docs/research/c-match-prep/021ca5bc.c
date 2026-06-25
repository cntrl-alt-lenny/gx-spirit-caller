/* CAMPAIGN-PREP candidate for func_021ca5bc (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     tst-flag dispatch; bit-mask gates; u16 load + 13-bit shift-extract
 *   risk:       021ca51c first-call needs arg0 live in r0 (no reload); the (v<<19)>>19 13-bit extract vs a :13 bitfield member could differ
 *   confidence: med
 */
/* func_ov002_021ca5bc: tst-flag dispatch. flags = 021ca51c(arg0) (arg0 left
 * live in r0). bit0 set => 0. bit1 set => gate on 0202e234 of a 13-bit field
 * from d0250[arg0]. bit2 set & (arg0&1)==0 => 0. bit3 set & (arg0&1)==1 => 0.
 * else 1. */
extern char data_ov002_022d0250[];
extern int func_0202e234(int v);
extern int func_ov002_021ca51c(int arg0);

int func_ov002_021ca5bc(int arg0) {
    int flags = func_ov002_021ca51c(arg0);
    if (flags & 1) return 0;
    if (flags & 2) {
        unsigned int v = *(unsigned short *)(data_ov002_022d0250 + arg0 * 4);
        if (func_0202e234((v << 19) >> 19) != 0) return 0;
    }
    if (flags & 4) {
        if ((arg0 & 1) == 0) return 0;
    }
    if (flags & 8) {
        if ((arg0 & 1) == 1) return 0;
    }
    return 1;
}
