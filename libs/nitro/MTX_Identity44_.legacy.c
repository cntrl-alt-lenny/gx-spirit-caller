/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/FX_mtx44.c
 *   function: MTX_Identity44_
 *   target:   MTX_Identity44_ (0x0208b920, size 0x2c)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1 callee remap.
 */

struct Mtx44;
struct Mtx44;
asm void MTX_Identity44_(struct Mtx44 *dst){
    mov r2, #0x1000
    mov r3, #0x0
    stmia r0!, {r2-r3}
    mov r1, #0x0
    stmia r0!, {r1,r3}
    stmia r0!, {r1-r3}
    stmia r0!, {r1,r3}
    stmia r0!, {r1-r3}
    stmia r0!, {r1,r3}
    stmia r0!, {r1-r2}
    bx lr
}
