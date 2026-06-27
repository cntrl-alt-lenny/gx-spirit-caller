/* CAMPAIGN-PREP candidate for func_02011620 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     angle>>4*2 shared index; ldrsh s,c; rsb=-s; 12-int store-order; 0x1000=1.0
 *   risk:       reshape-able/permuter-class: the two ldrsh loads are interleaved among the early zero-stores in asm; mwcc -O4 scheduling of the 2 loads + 8 zero stores is the only likely diverger (a coin-flip, values/order otherwise exact)
 *   confidence: med
 */
/* func_02011620 @ 0x02011620 (main, class D)
 * sincos table lookup + 3x4 (0x30-byte) matrix store fill. X-axis rotation.
 * r0 = dst matrix (12 ints), r1 = angle.
 *
 *   j = (angle >> 4) * 2;          // signed asr#4, then idx*2 (shared)
 *   s = tbl[j];                    // ldrsh, sin
 *   c = tbl[j + 1];                // ldrsh, cos
 *   m[0]=0x1000; m[1]=0;   m[2]=0; m[3]=0;
 *   m[4]=c;      m[5]=s;   m[6]=0; m[7]=-s;
 *   m[8]=c;      m[9]=0;   m[10]=0; m[11]=0;
 *
 * STORE-ORDER per asm; rsb => unary minus on s; asr#4 => signed >>4;
 * j and j+1 share the idx*2 product.
 */

extern short data_020bef80[];

void func_02011620(int *m, int angle)
{
    int j;
    int s;
    int c;

    j = (angle >> 4) * 2;
    s = data_020bef80[j];
    c = data_020bef80[j + 1];

    m[0]  = 0x1000;
    m[1]  = 0;
    m[2]  = 0;
    m[3]  = 0;
    m[4]  = c;
    m[5]  = s;
    m[6]  = 0;
    m[7]  = -s;
    m[8]  = c;
    m[9]  = 0;
    m[10] = 0;
    m[11] = 0;
}
