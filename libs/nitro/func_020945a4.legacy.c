/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/MI_memory.c
 *   function: MI_Copy48B
 *   target:   func_020945a4 (0x020945a4, size 0x24)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1 callee remap.
 */

asm void func_020945a4(register const void *pSrc, register void *pDest)
{
    ldmia r0!, {r2, r3, r12}
    stmia r1!, {r2, r3, r12}
    ldmia r0!, {r2, r3, r12}
    stmia r1!, {r2, r3, r12}
    ldmia r0!, {r2, r3, r12}
    stmia r1!, {r2, r3, r12}
    ldmia r0!, {r2, r3, r12}
    stmia r1!, {r2, r3, r12}

    bx lr
}
