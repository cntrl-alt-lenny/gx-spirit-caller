/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/OS_cache.c
 *   function: IC_InvalidateAll
 *   target:   IC_InvalidateAll (0x02092934, size 0xc)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1 callee remap.
 */

asm void IC_InvalidateAll(void)
{
    mov r0, #0
    mcr p15, 0, r0, c7, c5, 0 //Invalidate Entire Instruction Cache
    bx lr
}
