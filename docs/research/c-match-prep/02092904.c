/* CAMPAIGN-PREP candidate for func_02092904 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     CP15 cache flush range op -> asm{} block
 *   risk:       needs .legacy.c SP routing; hand-asm body otherwise byte-exact
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_02092904 (main, class A) - p_0035.
 * UNVERIFIED build-free draft: build with .legacy.c routing (NitroSDK SP match).
 *   recipe:     CP15 cache flush range op (drain WB + clean&invalidate) -> asm{} block
 *   risk:       exact .legacy.c SP revision routing; otherwise byte-exact (hand asm)
 *   confidence: high
 */
/* func_02092904: DC_FlushRange-style loop. ip=0; end=start+len; align down 32B;
 * per 32 bytes: mcr c7,c10,4 (drain write buffer) then c7,c14,1 (clean+invalidate
 * D-cache line). mcr is not C-expressible -> asm block. Save as
 * func_02092904.legacy.c. */
asm void func_02092904(register unsigned long start, register unsigned long len)
{
    mov     ip, #0x0
    add     r1, r1, r0
    bic     r0, r0, #0x1f
_loop:
    mcr     p15, 0, ip, c7, c10, 4
    mcr     p15, 0, r0, c7, c14, 1
    add     r0, r0, #0x20
    cmp     r0, r1
    blt     _loop
    bx      lr
}
