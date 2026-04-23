/* __sinit_ov010_021b89a8: 0x48 sinit outlier — three ctors then register-dtor.
 *
 * ARM disassembly (build/eur/asm/_dsd_gap@ov010_5.s):
 *
 *     stmdb sp!, {r4, lr}
 *     ldr  r0, .L_021b89dc           ; r0 = data_ov010_021b9294
 *     ldr  r4, .L_021b89e0           ; r4 = data_ov010_021b9260 (obj, cached)
 *     bl   func_ov010_021b285c       ; ctor(021b9294)
 *     ldr  r0, .L_021b89e4           ; r0 = data_ov010_021b92b8
 *     bl   func_ov010_021b285c       ; ctor(021b92b8)
 *     add  r0, r4, #0x84             ; r0 = obj + 0x84
 *     bl   func_ov010_021b365c       ; ctor2(obj + 0x84)
 *     ldr  r1, .L_021b89e8           ; r1 = func_ov010_021b67ec (dtor)
 *     ldr  r2, .L_021b89ec           ; r2 = data_ov010_021b91b4 (atexit)
 *     mov  r0, r4                    ; r0 = obj
 *     bl   __register_global_object
 *     ldmia sp!, {r4, pc}
 *
 * 13 instructions × 4B + 5 literal-pool words × 4B = 72B = 0x48. ✓
 *
 * Why `asm void`, not plain C — same family of escape-hatch as brief
 * 009's ov002 outlier. The natural C form
 *
 *     char *obj = data_ov010_021b9260;
 *     func_ov010_021b285c(data_ov010_021b9294);
 *     func_ov010_021b285c(data_ov010_021b92b8);
 *     func_ov010_021b365c(obj + 0x84);
 *     __register_global_object(obj, func_ov010_021b67ec,
 *                              data_ov010_021b91b4);
 *
 * compiles to logically-identical but byte-different code under
 * mwcc -O4,p: r4 is never used (pushed as r3 for alignment instead).
 * mwcc chooses to re-materialise `obj` from the literal pool on each
 * use, and pre-folds `obj + 0x84` into a new pool entry rather than
 * emit the `add r0, r4, #0x84`. Net: same 0x48 size, different
 * register-allocation decisions, no path via plain C to pin r4 as
 * the callee-saved obj cache mwcc's cost heuristic decided against.
 *
 * Inline asm via mwcc's `asm void` keyword pins the instruction
 * stream. The body below is one-to-one with the 13 baserom
 * instructions; mwcc/mwldarm handles the literal-pool layout and
 * relocations exactly the same way they would for a plain `bl` or
 * `ldr =sym` reference.
 */

#include <runtime/sinit.h>

extern void func_ov010_021b285c(void *arg);
extern void func_ov010_021b365c(void *arg);
extern void func_ov010_021b67ec(void *obj);

extern char data_ov010_021b9260[];
extern char data_ov010_021b9294[];
extern char data_ov010_021b92b8[];
extern char data_ov010_021b91b4[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

asm void __sinit_ov010_021b89a8(void) {
    stmdb sp!, {r4, lr}
    ldr  r0, =data_ov010_021b9294
    ldr  r4, =data_ov010_021b9260
    bl   func_ov010_021b285c
    ldr  r0, =data_ov010_021b92b8
    bl   func_ov010_021b285c
    add  r0, r4, #0x84
    bl   func_ov010_021b365c
    ldr  r1, =func_ov010_021b67ec
    ldr  r2, =data_ov010_021b91b4
    mov  r0, r4
    bl   __register_global_object
    ldmia sp!, {r4, pc}
}

#pragma section INIT end
