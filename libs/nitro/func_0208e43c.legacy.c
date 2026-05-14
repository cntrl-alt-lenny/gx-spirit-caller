/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/GX_g3x.c
 *   function: GXi_NopClearFifo128_
 *   target:   func_0208e43c (0x0208e43c, size 0x94)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1 callee remap.
 */

asm void func_0208e43c(void *reg){
    mov r1, #0x0
    mov r2, #0x0
    mov r3, #0x0
    mov r12, #0x0
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    stmia r0, {r1-r3,r12}
    bx lr
}
