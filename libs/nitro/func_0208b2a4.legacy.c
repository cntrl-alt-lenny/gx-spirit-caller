/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/FX_mtx43.c
 *   function: MTX_Identity43_
 *   target:   func_0208b2a4 (0x0208b2a4, size 0x28)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1 callee remap.
 */

struct Mtx43;
struct Mtx43;
asm void func_0208b2a4(struct Mtx43 *mtx){
    mov r2, #0x1000
    mov r3, #0x0
    stmia r0!, {r2-r3}
    mov r1, #0x0
    stmia r0!, {r1,r3}
    stmia r0!, {r2-r3}
    stmia r0!, {r1,r3}
    stmia r0!, {r2-r3}
    stmia r0!, {r1,r3}
    bx lr
}
