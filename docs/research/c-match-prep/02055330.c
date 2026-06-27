/* CAMPAIGN-PREP candidate for func_02055330 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     twin of 02054b9c minus out-store; guard==1; shifted-or hi-first; void return; sub sp,#4 frame
 *   risk:       the bare sub sp,#4/stmfd {lr} frame (no r4) requires func_020b3808 result be unused (void) so no callee-saved reg is allocated; shifted-or operand order as twin. reshape-able (operand-order / drop result), arg-guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02055330 (main, class C/D) - brief 0015.
 * UNVERIFIED build-free draft. Twin of 02054b9c WITHOUT the out-store:
 * guard(func_020931e8()==1) else assert; 64-bit read; shift-pack; call.
 * Note sub sp,#4 / single-saved-lr frame (no callee regs).
 */
extern char data_020ffbd8[];
extern char data_020ffbf8[];
extern int  func_020931e8(void);
extern unsigned long long func_020930b0(void);            /* r0=lo r1=hi */
extern int  func_020b3808(unsigned lo, unsigned hi, unsigned r2, int r3);
extern void func_020a6d54(char *file, char *expr, int zero, int line);

void func_02055330(void) {
    unsigned lo, hi;
    unsigned long long v;

    if (func_020931e8() != 1)
        func_020a6d54(data_020ffbd8, data_020ffbf8, 0, 0x109);

    v  = func_020930b0();
    lo = (unsigned)v;
    hi = (unsigned)(v >> 32);
    func_020b3808((lo << 6), (hi << 6) | (lo >> 26), 0x000082ea, 0);
}
