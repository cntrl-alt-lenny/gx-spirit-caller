/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/FX_mtx43.c
 *   function: MTX_Copy43To44_
 *   target:   func_0208b2cc (0x0208b2cc, size 0x34)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1 callee remap.
 */

struct Mtx43;
struct Mtx44;
struct Mtx43;
struct Mtx44;
asm void func_0208b2cc(struct Mtx43 *src, struct Mtx44 *dst){
    stmdb sp!, {r4}
    mov r12, #0x0
    ldmia r0!, {r2-r4}
    stmia r1!, {r2-r4,r12}
    ldmia r0!, {r2-r4}
    stmia r1!, {r2-r4,r12}
    ldmia r0!, {r2-r4}
    stmia r1!, {r2-r4,r12}
    mov r12, #0x1000
    ldmia r0!, {r2-r4}
    stmia r1!, {r2-r4,r12}
    ldmia sp!, {r4}
    bx lr
}
