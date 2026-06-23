; func_ov011_021d22a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov011_021d21e4
        .global func_ov011_021d22a0
        .arm
func_ov011_021d22a0:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    ldrsh r2, [r0]
    ldrsh r5, [r1]
    ldrsh r4, [r1, #0x2]
    mov r3, r2, lsl #0xc
    ldrsh r0, [r0, #0x2]
    mov r5, r5, lsl #0xc
    mov r4, r4, lsl #0xc
    mov r1, r0, lsl #0xc
    add r2, sp, #0x28
    str r3, [sp]
    add r0, sp, #0x0
    str r1, [sp, #0x4]
    str r5, [sp, #0x8]
    str r4, [sp, #0xc]
    ldmia r0, {r0, r1}
    ldmia r2, {r2, r3}
    bl func_ov011_021d21e4
    add r2, sp, #0x28
    add r1, sp, #0x8
    mov r5, r0
    ldmia r1, {r0, r1}
    ldmia r2, {r2, r3}
    bl func_ov011_021d21e4
    add r2, sp, #0x0
    add r1, sp, #0x8
    mov r4, r0
    ldmia r1, {r0, r1}
    ldmia r2, {r2, r3}
    bl func_ov011_021d21e4
    sub r1, r4, r5
    sub r0, r0, r1
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, lr}
    add sp, sp, #0x10
    bx lr
