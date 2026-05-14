/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/FX_mtx44.c
 *   function: MTX_Copy44To43_
 *   target:   func_0208b94c (0x0208b94c, size 0x34)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1 callee remap.
 */

struct Mtx43;
struct Mtx44;
struct Mtx43;
struct Mtx44;
asm void func_0208b94c(struct Mtx44 *src, struct Mtx43 *dst){
    ldmia r0!, {r2-r3,r12}
    add r0, r0, #0x4
    stmia r1!, {r2-r3,r12}
    ldmia r0!, {r2-r3,r12}
    add r0, r0, #0x4
    stmia r1!, {r2-r3,r12}
    ldmia r0!, {r2-r3,r12}
    add r0, r0, #0x4
    stmia r1!, {r2-r3,r12}
    ldmia r0!, {r2-r3,r12}
    add r0, r0, #0x4
    stmia r1!, {r2-r3,r12}
    bx lr
}
