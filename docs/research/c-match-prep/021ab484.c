/* CAMPAIGN-PREP candidate for func_021ab484 (ov008, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     stack stores in asm order; field<<k inline; base+e2*0x40+e3*4 = int* index e2*0x10+e3
 *   risk:       struct-guessed + reshape-able: the goto/label is illegal as written — must drop it; store ORDER (block[2]=0 split around the q load) is the real lever and likely needs the q computation interleaved exactly there. Confirm [r0,#8]->[+0x2c] chain.
 *   confidence: low
 */
/* func_ov008_021ab484: build a 0x28 stack arg-block (shifted fields,
   indexed table base) then one call. cls C (store-order / shifts). */

extern int data_ov008_021b2d34;   /* _LIT0 base, +r2*0x40 + r3*4 */

extern void func_0201e964(int a0, void *p, void *block, int zero);

/* incoming: r0,r1 (<<12), r2 idx0, r3 idx1; stack params at +0x30.. */
int func_ov008_021ab484(int a0, int a1, int e2, int e3,
                        int s30, int s34, int s38, int s3c)
{
    int block[10];   /* sp..sp+0x1c, 0x28 bytes; block[8..9]=a0,a1<<12 */
    int *q;

    block[8] = a0 << 12;   /* [sp,#0x20] */
    block[9] = a1 << 12;   /* [sp,#0x24] */
    block[0] = 0;
    block[1] = 0;
    q = (int *)(&data_ov008_021b2d34 + e2 * 0x10 + e3);
    block[2] = 0;
    block[3] = s3c;
    block[4] = s34 << 7;
    block[5] = s38;
    block[6] = 0;
    block[7] = 0;
    {
        int *node = (int *)q[2];          /* [r0,#0x8] */
        return_helper:
        func_0201e964(2,
                      (void *)(node[0xb] + s30 * 8), /* [r1,#0x2c] + s30<<3 */
                      &block[8],
                      0);
    }
    (void)return_helper;
    return 0;
}
