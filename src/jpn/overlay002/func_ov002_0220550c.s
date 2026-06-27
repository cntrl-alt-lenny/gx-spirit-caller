; func_ov002_0220550c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202e1e0
        .extern func_ov002_021b9a84
        .global func_ov002_0220550c
        .arm
func_ov002_0220550c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x16
    bne .L_a8
    ldr r0, [r4, #0x14]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x17
    bl func_ov002_021b9a84
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r2, [r4, #0x2]
    ldr r3, [r4, #0x14]
    mov r1, r3, lsl #0x16
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    cmp r1, r2, lsr #0x1f
    mov r2, r2, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, [r0]
    rsb r0, r2, #0x1
    mov r2, r1, lsl #0x12
    mov r2, r2, lsr #0x1f
    cmp r2, r0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r3, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r1, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.L_a8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
