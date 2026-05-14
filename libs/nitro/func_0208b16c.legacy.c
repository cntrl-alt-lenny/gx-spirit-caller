/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/FX_mtx33.c
 *   function: MTX_Identity33_
 *   target:   func_0208b16c (0x0208b16c, size 0x24)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1 callee remap.
 */

struct Mtx33;
struct Mtx33;
asm void func_0208b16c(struct Mtx33 *mtx){
    mov r2, #0x1000
    str r2, [r0, #0x20]
    mov r3, #0x0
    stmia r0!, {r2-r3}
    mov r1, #0x0
    stmia r0!, {r1,r3}
    stmia r0!, {r2-r3}
    stmia r0!, {r1,r3}
    bx lr
}
