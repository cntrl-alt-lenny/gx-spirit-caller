/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/GX_asm.c
 *   function: GX_SendFifo48B
 *   target:   func_020903b0 (0x020903b0, size 0x24)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1 callee remap.
 */

asm void func_020903b0(void *src, void *dst) {
    ldmia r0!, {r2-r3,r12}
    stmia r1, {r2-r3,r12}
    ldmia r0!, {r2-r3,r12}
    stmia r1, {r2-r3,r12}
    ldmia r0!, {r2-r3,r12}
    stmia r1, {r2-r3,r12}
    ldmia r0!, {r2-r3,r12}
    stmia r1, {r2-r3,r12}
    bx lr
}
