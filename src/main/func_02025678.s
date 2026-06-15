; func_02025678 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202162c
        .extern func_02021660
        .extern func_02025880
        .extern func_02025a80
        .extern func_020265e4
        .global func_02025678
        .arm
func_02025678:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    add r0, r4, #0x100
    ldrh r1, [r0, #0x6a]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    beq .L_124c
    ldr r1, _LIT0
    mov r2, #0x2
    str r2, [r1]
    ldrh r0, [r0, #0x6a]
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    bne .L_1134
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
.L_1134:
    add r0, r4, #0x100
    ldrh r2, [r0, #0x6a]
    mov r1, r2, lsl #0x1d
    movs r1, r1, lsr #0x1f
    beq .L_11c4
    mov r1, r2, lsl #0x1e
    movs r1, r1, lsr #0x1f
    ldrne r1, [r4, #0xd0]
    cmpne r1, #0x0
    beq .L_11cc
    mov r1, r2, lsl #0x17
    movs r1, r1, lsr #0x1f
    mov r1, #0x1
    beq .L_11b0
    ldrsh r5, [r0, #0x66]
    cmp r5, #0x0
    bge .L_1190
    mov r0, r4
    bl func_02025880
    cmp r0, #0x0
    moveq r1, #0x1
    movne r1, #0x0
    b .L_11b0
.L_1190:
    bl func_0202162c
    mov r2, r5
    mov r1, #0x3
    bl func_02021660
    bl func_02025880
    cmp r0, #0x0
    moveq r1, #0x1
    movne r1, #0x0
.L_11b0:
    cmp r1, #0x0
    beq .L_11cc
    mov r0, r4
    bl func_02025a80
    b .L_11cc
.L_11c4:
    mov r0, r4
    bl func_020265e4
.L_11cc:
    add r0, r4, #0x100
    ldrh r0, [r0, #0x6a]
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    bne .L_124c
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
.L_124c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x04000440
