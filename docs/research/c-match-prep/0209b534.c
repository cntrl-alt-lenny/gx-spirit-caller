/* CAMPAIGN-PREP candidate for func_0209b534 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     volatile spin-loop (no-call reload), leaf default .c
 *   risk:       none significant; volatile forces the [ip] reload; ip vs other scratch reg could differ but unlikely
 *   confidence: high
 */
/* file: src/main/func_0209b534.c  (default mwcc 2.0/sp1p5)
 * Frameless leaf, plain `bx lr` (no push/pop) => default .c.
 * Trivial spin-wait on a global with NO calls in the loop, so the
 * value must be forced to reload each iteration => volatile. mwcc
 * loads the address once into a scratch reg (ip) and reloads [ip]. */

extern volatile int data_021a8438;

void func_0209b534(void) {
    while (data_021a8438 == 1) {
        /* busy-wait */
    }
}
