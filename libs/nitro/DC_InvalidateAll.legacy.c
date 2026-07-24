/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/OS_cache.c
 *   function: DC_InvalidateAll
 *   target:   DC_InvalidateAll (0x02092860, size 0xc)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1 callee remap.
 */

asm void DC_InvalidateAll(void)
{
    mov r0, #0
    mcr p15, 0, r0, c7, c6, 0 //Invalidate Entire Data Cache
    bx lr
}
