; func_020a6dc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a6d90
        .extern func_020a6d94
        .global func_020a6dc4
        .arm
func_020a6dc4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x24]
    ldr r0, [r5, #0x1c]
    mov r4, r1
    subs r0, r2, r0
    beq .L_78
    str r0, [r5, #0x28]
    ldr r0, [r5, #0x4]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x1f
    bne .L_3c
    ldr r0, [r5, #0x1c]
    add r1, r5, #0x28
    bl func_020a6d90
.L_3c:
    ldr r0, [r5]
    ldr r1, [r5, #0x1c]
    ldr r3, [r5, #0x48]
    ldr ip, [r5, #0x40]
    add r2, r5, #0x28
    blx ip
    cmp r4, #0x0
    ldrne r1, [r5, #0x28]
    strne r1, [r4]
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, [r5, #0x18]
    ldr r0, [r5, #0x28]
    add r0, r1, r0
    str r0, [r5, #0x18]
.L_78:
    mov r0, r5
    bl func_020a6d94
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
