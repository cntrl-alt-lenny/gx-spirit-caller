/* CAMPAIGN-PREP candidate for func_0204937c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload *data per store (never bind base); exact store order; stack-arg slots r5/r4/lr/ip preload
 *   risk:       orig pre-loads a4,a5,a6,a7 from stack INTERLEAVED with the early stores (ldr r5/[sp+0x10] etc. between str's), and reloads g every store; mwcc -O4 will likely CSE the base into one reg -> the repeated ldr r1,[r0] vanish. permuter-class (mwcc volatility needed to defeat CSE) / struct-guessed.
 *   confidence: low
 */
/* func_0204937c (main, class C, bind-vs-RELOAD heavy). g = *data_0219dc80.
 * Stack args a4=[sp,#0x10], a5=[sp,#0x14], a6=[sp,#0x18], a7=[sp,#0x1c].
 * Orig RELOADS *data_0219dc80 before EVERY field store (no caching).
 * Field stores in exact order: f2c=p2, f30=p3, f34=a4, f38=a5, f3c=a6,
 * f40=a7, b1d=0,b1e=0,b1f=0,b1c=0, f0=1; then if g->f18==0 g->b1f++; g->b1f++. */

typedef struct State0204937c {
    int            f0;          /* +0x00 */
    char           _pad0[0x18];
    int            f18;         /* +0x18 */
    char           _pad1[0x4];  /* 0x1c */
    unsigned char  b1c;         /* +0x1c */
    unsigned char  b1d;         /* +0x1d */
    unsigned char  b1e;         /* +0x1e */
    unsigned char  b1f;         /* +0x1f */
    char           _pad2[0xc];
    int            f2c;         /* +0x2c */
    int            f30;         /* +0x30 */
    int            f34;         /* +0x34 */
    int            f38;         /* +0x38 */
    int            f3c;         /* +0x3c */
    int            f40;         /* +0x40 */
} State0204937c;

extern State0204937c *data_0219dc80;

void func_0204937c(int p0, int p1, int p2, int p3, int a4, int a5, int a6, int a7) {
    data_0219dc80->f2c = p2;
    data_0219dc80->f30 = p3;
    data_0219dc80->f34 = a4;
    data_0219dc80->f38 = a5;
    data_0219dc80->f3c = a6;
    data_0219dc80->f40 = a7;
    data_0219dc80->b1d = 0;
    data_0219dc80->b1e = 0;
    data_0219dc80->b1f = 0;
    data_0219dc80->b1c = 0;
    data_0219dc80->f0  = 1;
    if (data_0219dc80->f18 == 0) {
        data_0219dc80->b1f++;
    }
    data_0219dc80->b1f++;
}
