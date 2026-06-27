/* CAMPAIGN-PREP candidate for func_02054b9c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard==1 assert; 64-bit lo/hi from r0/r1; shifted-or hi-first (hi<<6)|(lo>>26); strne *out
 *   risk:       orr r1,(hi<<6),(lo>>26) needs shifted operand SECOND but accumulator(hi<<6) FIRST to pick r1; lo<<6 computed in place. arg3 r2=0x01ff6210 literal, r3=0. reshape-able (shifted-or operand-order), struct/arg-guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02054b9c (main, class C/D) - brief 0015.
 * UNVERIFIED build-free draft. recipe: guard(func_020931e8()==1) else
 * assert; read 64-bit via func_020930b0; shift-pack (hi<<6)|(lo>>26) and
 * lo<<6; call func_020b3808; conditional store result to *out.
 */
extern char data_020ffbd8[];
extern char data_020ffbf8[];
extern int  func_020931e8(void);
extern unsigned long long func_020930b0(void);            /* r0=lo r1=hi */
extern int  func_020b3808(unsigned lo, unsigned hi, unsigned r2, int r3);
extern void func_020a6d54(char *file, char *expr, int zero, int line);

int func_02054b9c(int *out) {
    unsigned lo, hi;
    unsigned long long v;
    int r;

    if (func_020931e8() != 1)
        func_020a6d54(data_020ffbd8, data_020ffbf8, 0, 0x667);

    v  = func_020930b0();
    lo = (unsigned)v;
    hi = (unsigned)(v >> 32);
    r  = func_020b3808((lo << 6), (hi << 6) | (lo >> 26), 0x01ff6210, 0);
    if (out != 0)
        *out = r;
    return r;
}
