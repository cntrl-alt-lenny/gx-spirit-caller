/* CAMPAIGN-PREP candidate for func_020116ec (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order in asm sequence; signed >>4 index; halfword LUT loads; -a via unary minus
 *   risk:       mwcc may load b/a in opposite order or not reuse b for both [0] and [0x10]; if so two ldrsh/reg-pick diverge. reshape-able (swap a/b decl order).
 *   confidence: med
 */
/* func_020116ec: build a 0x30-byte record from a short LUT (data_020bef80),
 * indexed by (arg1>>4). Two halfwords a=tbl[2n], b=tbl[2n+1] are scattered
 * into the output with a sign-flip and a constant 0x1000 field; stores must
 * land in stmib order ( [0],[4],[8] then [c]..[2c] ). */
extern short data_020bef80[];

void func_020116ec(int *out, int sel)
{
    int n = sel >> 4;
    int a = data_020bef80[2 * n];
    int b = data_020bef80[2 * n + 1];
    out[0] = b;        /* str  r3,[r0]      */
    out[1] = a;        /* stmib r0,{r1,r2}  -> [4]=a */
    out[2] = 0;        /*                      [8]=0 */
    out[3] = -a;       /* str  r1,[r0,#0xc] */
    out[4] = b;        /* str  r3,[r0,#0x10]*/
    out[5] = 0;        /* [0x14] */
    out[6] = 0;        /* [0x18] */
    out[7] = 0;        /* [0x1c] */
    out[8] = 0x1000;   /* [0x20] */
    out[9] = 0;        /* [0x24] */
    out[10] = 0;       /* [0x28] */
    out[11] = 0;       /* [0x2c] */
}
