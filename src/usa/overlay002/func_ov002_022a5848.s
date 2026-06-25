; func_ov002_022a5848 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_022a4920
        .extern func_ov002_022a4dc8
        .extern func_ov002_022a50d0
        .global func_ov002_022a5848
        .arm
func_ov002_022a5848:
    stmdb sp!, {r3, lr}
    ldr r1, [r0]
    cmp r1, #0xa
    addls pc, pc, r1, lsl #0x2
    ldmia sp!, {r3, pc}
    ldmia sp!, {r3, pc}
    ldmia sp!, {r3, pc}
    ldmia sp!, {r3, pc}
    b .L_7c0
    b .L_7b8
    b .L_7d0
    b .L_7c8
    b .L_7c8
    b .L_7c8
    b .L_7c8
    b .L_7d0
.L_7b8:
    bl func_ov002_022a4dc8
    ldmia sp!, {r3, pc}
.L_7c0:
    bl func_ov002_022a4920
    ldmia sp!, {r3, pc}
.L_7c8:
    bl func_ov002_022a50d0
    ldmia sp!, {r3, pc}
.L_7d0:
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
    ldmia sp!, {r3, pc}
