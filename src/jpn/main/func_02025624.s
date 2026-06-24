; func_02025624 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020215d8
        .extern func_0202160c
        .extern func_0202582c
        .extern func_02025a2c
        .extern func_02026590
        .global func_02025624
        .arm
func_02025624:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    add r0, r4, #0x100
    ldrh r1, [r0, #0x6a]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    beq .L_1204
    ldr r1, _LIT0
    mov r2, #0x2
    str r2, [r1]
    ldrh r0, [r0, #0x6a]
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    bne .L_10ec
    ldr r0, [r4, #0xac]
    mov r0, r0, lsl #0x4
    str r0, [r4, #0xac]
    ldr r0, [r4, #0xb0]
    mov r0, r0, lsl #0x4
    str r0, [r4, #0xb0]
    ldr r0, [r4, #0xb4]
    mov r0, r0, lsl #0x4
    str r0, [r4, #0xb4]
    ldr r0, [r4, #0xdc]
    mov r0, r0, lsl #0x4
    str r0, [r4, #0xdc]
    ldr r0, [r4, #0xe0]
    mov r0, r0, lsl #0x4
    str r0, [r4, #0xe0]
    ldr r0, [r4, #0xe4]
    mov r0, r0, lsl #0x4
    str r0, [r4, #0xe4]
    ldr r0, [r4, #0xc4]
    mov r0, r0, lsl #0x4
    str r0, [r4, #0xc4]
    ldr r0, [r4, #0xc8]
    mov r0, r0, lsl #0x4
    str r0, [r4, #0xc8]
    ldr r0, [r4, #0xcc]
    mov r0, r0, lsl #0x4
    str r0, [r4, #0xcc]
.L_10ec:
    add r0, r4, #0x100
    ldrh r2, [r0, #0x6a]
    mov r1, r2, lsl #0x1d
    movs r1, r1, lsr #0x1f
    beq .L_117c
    mov r1, r2, lsl #0x1e
    movs r1, r1, lsr #0x1f
    ldrne r1, [r4, #0xd0]
    cmpne r1, #0x0
    beq .L_1184
    mov r1, r2, lsl #0x17
    movs r1, r1, lsr #0x1f
    mov r1, #0x1
    beq .L_1168
    ldrsh r5, [r0, #0x66]
    cmp r5, #0x0
    bge .L_1148
    mov r0, r4
    bl func_0202582c
    cmp r0, #0x0
    moveq r1, #0x1
    movne r1, #0x0
    b .L_1168
.L_1148:
    bl func_020215d8
    mov r2, r5
    mov r1, #0x3
    bl func_0202160c
    bl func_0202582c
    cmp r0, #0x0
    moveq r1, #0x1
    movne r1, #0x0
.L_1168:
    cmp r1, #0x0
    beq .L_1184
    mov r0, r4
    bl func_02025a2c
    b .L_1184
.L_117c:
    mov r0, r4
    bl func_02026590
.L_1184:
    add r0, r4, #0x100
    ldrh r0, [r0, #0x6a]
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    bne .L_1204
    ldr r0, [r4, #0xac]
    mov r0, r0, asr #0x4
    str r0, [r4, #0xac]
    ldr r0, [r4, #0xb0]
    mov r0, r0, asr #0x4
    str r0, [r4, #0xb0]
    ldr r0, [r4, #0xb4]
    mov r0, r0, asr #0x4
    str r0, [r4, #0xb4]
    ldr r0, [r4, #0xdc]
    mov r0, r0, asr #0x4
    str r0, [r4, #0xdc]
    ldr r0, [r4, #0xe0]
    mov r0, r0, asr #0x4
    str r0, [r4, #0xe0]
    ldr r0, [r4, #0xe4]
    mov r0, r0, asr #0x4
    str r0, [r4, #0xe4]
    ldr r0, [r4, #0xc4]
    mov r0, r0, asr #0x4
    str r0, [r4, #0xc4]
    ldr r0, [r4, #0xc8]
    mov r0, r0, asr #0x4
    str r0, [r4, #0xc8]
    ldr r0, [r4, #0xcc]
    mov r0, r0, asr #0x4
    str r0, [r4, #0xcc]
.L_1204:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x04000440
