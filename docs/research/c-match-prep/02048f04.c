/* CAMPAIGN-PREP candidate for func_02048f04 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u64 delta-subtract via sbc; store-order lo+0xc then hi+0x10; counter store before call
 *   risk:       func_020b3808 arity/return guessed: orig passes (delta<<6) as a u64 in r0:r1 then r2=0x82ea,r3=0. If the helper's real signature isn't (u64,int,int) the shift-pack (lsl#6/orr/lsr#0x1a) diverges. struct-guessed.
 *   confidence: low
 */
/* func_02048f04 - main - class D (64-bit timer delta + threshold, store-order).
 * data_0219dc80 is a pointer-to-struct; p->t0c/t10 hold a u64 timestamp,
 * p->f08 a counter, p->f04 a handle. now=func_020930b0() (u64).
 * delta=now-stamp; func_020b3808((delta<<6), 0x82ea, 0) -> u64; if >=300
 * bump counter, re-stamp with a fresh now, return func_02055fec(p->f04). */

typedef unsigned long long u64;

typedef struct {
    char        _pad00[4];
    int         f04;     /* +0x04 handle */
    int         f08;     /* +0x08 counter */
    int         t0c;     /* +0x0c stamp lo */
    int         t10;     /* +0x10 stamp hi */
} Timer02048f04;

extern Timer02048f04 *data_0219dc80;
extern u64 func_020930b0(void);
extern u64 func_020b3808(u64 v, int a, int b);
extern int func_02055fec(int handle);

int func_02048f04(void) {
    Timer02048f04 *p;
    u64 now;
    u64 delta;
    int ret;

    p = data_0219dc80;
    ret = 0;
    now = func_020930b0();
    delta = now - *(u64 *)&p->t0c;
    if (func_020b3808(delta << 6, 0x82ea, 0) >= 0x12c) {
        p->f08 += 1;
        ret = func_02055fec(data_0219dc80->f04);
        now = func_020930b0();
        *(u64 *)&data_0219dc80->t0c = now;
    }
    return ret;
}
