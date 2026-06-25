/* CAMPAIGN-PREP candidate for func_020b1840 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     varargs home-area spill + sign-bit AND mask
 *   risk:       va_list over (int a,...) homes r1-r3 (sp-=12), not all-4 (sp-=16); deferred varargs family needs a va_list shim to reproduce the [sp,#4] read
 *   confidence: low
 */
/* func_020b1840 (main, A) — varargs signbit: home r0-r3, read 2nd word, mask sign.
 * asm: stmdb {r0,r1,r2,r3}; ldr r0,[sp,#4]; and r0,#0x80000000; add sp,#0x10; bx lr
 * The all-4-reg home + raw [sp,#4] read is the classic varargs home-area; the
 * value at sp+4 is the high (sign) word of a double passed in r0:r1, so this is
 * effectively signbit(double). mwcc only spills {r0,r1,r2,r3} as one stmdb for a
 * fully-variadic prototype, hence the va_list shape below. */
#include <stdarg.h>

int func_020b1840(int a, ...)
{
    va_list ap;
    int hi;
    va_start(ap, a);
    hi = va_arg(ap, int);
    va_end(ap);
    return hi & 0x80000000;
}
