/* CAMPAIGN-PREP candidate for func_0206f170 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D divmod-adjacent: acc*10+d as mla; mask to byte; loop-publish ptr
 *   risk:       orig fuses mlals (computed every iter) with carry-preserved cmp predicate (ls reads C from cmp, Z from mla); mwcc emits separate mul+add+cmp -> permuter-class, likely escapes to .s
 *   confidence: low
 */
/* func_0206f170: atoi-style accumulate loop using mlals.
 *
 *     str  r0, [r1]
 *     mov  ip, #0x0
 *     mov  r2, #0xa
 * .L_bc:
 *     ldrb r3, [r0]
 *     sub  r3, r3, #0x30
 *     and  r3, r3, #0xff
 *     cmp  r3, #0x9
 *     mlals ip, r2, ip, r3      ; ip = 10*ip + digit (flags from result; C preserved from cmp)
 *     addls r0, r0, #0x1
 *     strls r0, [r1]
 *     bls  .L_bc
 *     mov  r0, ip
 *     bx   lr
 *
 * Reads decimal digits at *p, accumulates acc=acc*10+digit while the
 * byte (*p-'0') is <= 9, advancing p and publishing it through *out.
 */

unsigned int func_0206f170(unsigned char *p, unsigned char **out) {
    unsigned int acc = 0;
    unsigned int d;
    *out = p;
    while ((d = (unsigned char)(*p - 0x30)) <= 9) {
        acc = acc * 10 + d;
        *out = ++p;
    }
    return acc;
}
