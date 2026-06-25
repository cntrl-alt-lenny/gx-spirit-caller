/* CAMPAIGN-PREP candidate for func_020928cc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     CP15 cache-range op -> asm{} block (mcr inexpressible in C)
 *   risk:       needs .legacy.c SP routing; hand-asm body is otherwise byte-exact
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_020928cc (main, class A) - p_0035.
 * UNVERIFIED build-free draft: drop into src/, build with .legacy.c routing
 * (mwcc 1.2 NitroSDK SP match) like the other OS_cache range ops.
 *   recipe:     CP15 cache range op -> asm{} block (mcr not expressible in C)
 *   risk:       exact .legacy.c SP revision routing; otherwise byte-exact (hand asm)
 *   confidence: high
 */
/* func_020928cc: DC_InvalidateRange-style loop. r0=start, r1=len; end=start+len,
 * align start down to 32B cache line, mcr p15 c7,c6,1 (invalidate D-cache line)
 * each 32 bytes. mcr cannot be emitted by mwcc from C -> asm block, matching
 * the existing libs/nitro/func_0209xxxx.legacy.c cache ops. Save as
 * func_020928cc.legacy.c. */
asm void func_020928cc(register unsigned long start, register unsigned long len)
{
    add     r1, r1, r0
    bic     r0, r0, #0x1f
_loop:
    mcr     p15, 0, r0, c7, c6, 1
    add     r0, r0, #0x20
    cmp     r0, r1
    blt     _loop
    bx      lr
}
