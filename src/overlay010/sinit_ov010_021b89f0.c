/* __sinit_ov010_021b89f0: 0x48 sinit outlier — twin of _021b89a8.
 * Same shape, different addresses, and `obj + 0x8c` (vs +0x84).
 * See sinit_ov010_021b89a8.c for the full disassembly walkthrough
 * and the rationale for using `asm void` instead of plain C.
 */

#include <runtime/sinit.h>

extern void func_ov010_021b285c(void *arg);
extern void func_ov010_021b365c(void *arg);
extern void func_ov010_021b8848(void *obj);

extern char data_ov010_021b9890[];
extern char data_ov010_021b98cc[];
extern char data_ov010_021b98f0[];
extern char data_ov010_021b9884[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

asm void __sinit_ov010_021b89f0(void) {
    stmdb sp!, {r4, lr}
    ldr  r0, =data_ov010_021b98cc
    ldr  r4, =data_ov010_021b9890
    bl   func_ov010_021b285c
    ldr  r0, =data_ov010_021b98f0
    bl   func_ov010_021b285c
    add  r0, r4, #0x8c
    bl   func_ov010_021b365c
    ldr  r1, =func_ov010_021b8848
    ldr  r2, =data_ov010_021b9884
    mov  r0, r4
    bl   __register_global_object
    ldmia sp!, {r4, pc}
}

#pragma section INIT end
