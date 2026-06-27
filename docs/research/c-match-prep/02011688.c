/* CAMPAIGN-PREP candidate for func_02011688 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     angle>>4*2 shared idx; load c(j+1) before s(j); rsb=-s; leaf; 12-int store-order
 *   risk:       reshape-able: asm loads c (tbl[j+1]) before s (tbl[j]) -- decl/use order (c first) drives it; if mwcc swaps the two ldrsh, flip the declaration order. Otherwise byte-exact
 *   confidence: med
 */
/* func_02011688 @ 0x02011688 (main, class D)
 * leaf sincos struct-init, shift math + store-order sensitive. Twin of
 * func_02011620 but a different rotation matrix (this one ships as a leaf,
 * no stmdb). r0 = dst matrix (12 ints), r1 = angle.
 *
 *   j = (angle >> 4) * 2;
 *   c = tbl[j + 1];                // ldrsh first
 *   s = tbl[j];                    // ldrsh second
 *   m[0]=c;      m[1]=0;   m[2]=-s;     m[3]=0;
 *   m[4]=0x1000; m[5]=0;   m[6]=s;      m[7]=0;
 *   m[8]=c;      m[9]=0;   m[10]=0;     m[11]=0;
 *
 * STORE-ORDER per asm; rsb => unary minus on s; asr#4 => signed >>4;
 * c (tbl[j+1]) is loaded before s (tbl[j]) -- declare/use c first.
 */

extern short data_020bef80[];

void func_02011688(int *m, int angle)
{
    int j;
    int c;
    int s;

    j = (angle >> 4) * 2;
    c = data_020bef80[j + 1];
    s = data_020bef80[j];

    m[0]  = c;
    m[1]  = 0;
    m[2]  = -s;
    m[3]  = 0;
    m[4]  = 0x1000;
    m[5]  = 0;
    m[6]  = s;
    m[7]  = 0;
    m[8]  = c;
    m[9]  = 0;
    m[10] = 0;
    m[11] = 0;
}
