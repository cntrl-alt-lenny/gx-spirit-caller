/* CAMPAIGN-PREP candidate for func_0220472c (ov002, class D) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     6-bit field guard + bit21 raw-shift vs bit0 compare
 *   risk:       frameless single-return predicate -> mwcc may predicate where orig branches (inline-vs-branch wall)
 *   confidence: low
 */
/* func_ov002_0220472c: frameless bitfield-bit-compare predicate.
 *   field6 (bits6..11 of u16@+2) must == 0xf, else return 0;
 *   then compare bit21 of *(int*)(self+0x14) against bit0 of u16@+2,
 *   return (they differ) ? 1 : 0.
 *     ldrh r2,[r0,#2]; r1=(r2<<20)>>26; cmp#0xf; bne ret0
 *     ldr r1,[r0,#0x14]; r0=r2<<31; r1=(r1<<10)>>31; cmp r1,r0,lsr#31
 *     movne#1; moveq#0; bx lr
 */
typedef unsigned short u16;
struct S0220472c { u16 b0 : 1; u16 pad : 5; u16 k : 6; };

int func_ov002_0220472c(void *self) {
    struct S0220472c *s = (struct S0220472c *)((char *)self + 2);
    unsigned int hi;
    if (s->k != 0xf) return 0;
    hi = (unsigned)(*(int *)((char *)self + 0x14) << 10) >> 31; /* bit21 */
    return hi != (unsigned)s->b0;
}
