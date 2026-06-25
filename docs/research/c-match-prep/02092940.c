/* CAMPAIGN-PREP candidate for func_02092940 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     CP15 I-cache invalidate range op -> asm{} block
 *   risk:       needs .legacy.c SP routing; hand-asm body otherwise byte-exact
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_02092940 (main, class A) - p_0035.
 * UNVERIFIED build-free draft: build with .legacy.c routing (NitroSDK SP match).
 *   recipe:     CP15 cache range op (clone of 28cc, different CRm) -> asm{} block
 *   risk:       exact .legacy.c SP revision routing; otherwise byte-exact (hand asm)
 *   confidence: high
 */
/* func_02092940: IC_InvalidateRange-style loop. r0=start,r1=len; align down 32B,
 * mcr p15 c7,c5,1 (invalidate I-cache line) per 32 bytes to start+len. Same
 * shape as func_020928cc with CRm=c5. mcr not C-expressible -> asm block. Save
 * as func_02092940.legacy.c. */
asm void func_02092940(register unsigned long start, register unsigned long len)
{
    add     r1, r1, r0
    bic     r0, r0, #0x1f
_loop:
    mcr     p15, 0, r0, c7, c5, 1
    add     r0, r0, #0x20
    cmp     r0, r1
    blt     _loop
    bx      lr
}
