/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/OS_cache.c
 *   function: IC_InvalidateAll
 *   target:   func_02092934 (0x02092934, size 0xc)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1 callee remap.
 */

asm void func_02092934(void)
{
    mov r0, #0
    mcr p15, 0, r0, c7, c5, 0 //Invalidate Entire Instruction Cache
    bx lr
}
