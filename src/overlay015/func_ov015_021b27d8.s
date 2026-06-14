; func_ov015_021b27d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207f934
        .extern func_ov015_021b28a8
        .global func_ov015_021b27d8
        .arm
func_ov015_021b27d8:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x14
    mov r6, r0
    ldrsh r3, [r6, #0x1c]
    mov r5, r1
    mov r4, r2
    mov r1, r3, lsl #0xc
    str r1, [sp, #0xc]
    ldrsh r1, [r6, #0x1e]
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x10]
    bl func_ov015_021b28a8
    cmp r0, #0x1
    moveq r2, #0x1
    add r0, sp, #0xc
    mov r3, #0x0
    stmia sp, {r0, r3}
    str r3, [sp, #0x8]
    ldr r1, [r4]
    movne r2, #0x0
    mov r1, r1, lsl #0x10
    ldr r0, [r5]
    ldr r2, [r6, r2, lsl #0x2]
    mov r1, r1, lsr #0x10
    bl func_0207f934
    ldr r1, [r5]
    add r1, r1, r0, lsl #0x3
    str r1, [r5]
    ldr r1, [r4]
    sub r1, r1, r0
    str r1, [r4]
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, r5, r6, pc}
