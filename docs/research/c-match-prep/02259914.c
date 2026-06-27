/* CAMPAIGN-PREP candidate for func_02259914 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla stride*0x868 as array[a&1]; bitfield extract via explicit shifts; &0xffff
 *   risk:       struct-guessed: the 0x868 stride / 0x418 base offset and table element type are inferred; confirm against real struct. Reshape-able if the extract reg-alloc diverges (the (v<<2)>>24 / (v<<18)>>31 pair).
 *   confidence: med
 */
/* func_ov002_02259914: class D. Pack (a&1)<<31 | 0x4e0000 | (b&0xffff)
 * into r4; call 021c2e34(packed,b); if result<0 return 0. Else index
 * table data_022cf16c + (a&1)*0x868 + 0x18 + 0x400, load word at
 * [base + result*4], extract bitfields, tail-ish call 021fd81c.
 * Bitfield extract from word v (idiom A, seen in matched 022598ec):
 *   ((v>>22)&0xff)*2 + (v>>31)
 * which the asm builds as ((v<<2)>>24)<<1 + (v<<18)>>31.
 */
struct StateRow02259914 {
    char pad[0x418];      /* 0x18 + 0x400 */
    int  tbl[1];          /* table indexed by result */
};
extern struct StateRow02259914 data_ov002_022cf16c[2];   /* stride 0x868 via (a&1) */
extern int func_ov002_021c2e34(unsigned int packed, int b);
extern int func_ov002_021fd81c(unsigned int r0, unsigned int r1, int r2);

int func_ov002_02259914(int a, int b)
{
    unsigned int r4 = (((unsigned int)a << 31) & 0x80000000u) | 0x4e0000u | (b & 0xffffu);
    int res = func_ov002_021c2e34(r4, b);
    if (res < 0)
        return 0;
    {
        unsigned int v = (unsigned int)data_ov002_022cf16c[a & 1].tbl[res];
        unsigned int r1 = (((v << 2) >> 24) << 1) + (v >> 31);
        return func_ov002_021fd81c(r4, r1 & 0xffffu, 0);
    }
}
