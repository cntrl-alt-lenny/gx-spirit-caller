/* CAMPAIGN-PREP candidate for func_02093814 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     asm-block (empty delay loop elided by -O4)
 *   risk:       Belongs as hand .s; pure-C while-loop would be optimised away. asm{} byte-exactness must be confirmed.
 *   confidence: low
 */
/* func_02093814: tight micro-delay loop (subtract 4 until unsigned underflow).
 * An empty-bodied countdown is deleted at -O4, so it cannot be matched from
 * plain C; ships as an asm body. */

asm void func_02093814(void) {
    nofralloc
_loop:
    subs r0, r0, #0x4
    bhs  _loop
    bx   lr
}
