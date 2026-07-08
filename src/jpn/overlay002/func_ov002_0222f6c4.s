; func_ov002_0222f6c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021b9a84
        .extern func_ov002_021bc538
        .extern func_ov002_021ca1d8
        .extern func_ov002_021e277c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_022535a4
        .extern func_ov002_0226af64
        .extern func_ov002_0226b0a4
        .extern func_ov002_0227ab74
        .global func_ov002_0222f6c4
        .arm
func_ov002_0222f6c4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r5, r0
    ldr r3, [r1, #0x5a8]
    ldr r0, [r2, #0xcec]
    ldr r2, [r1, #0x5ac]
    cmp r3, #0x6e
    eor r4, r0, r2
    bgt .L_34
    cmp r3, #0x6e
    beq .L_184
    b .L_1a4
.L_34:
    sub r0, r3, #0x77
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_1a4
    b .L_130
    b .L_108
    b .L_f8
    b .L_1a4
    b .L_1a4
    b .L_1a4
    b .L_1a4
    b .L_e0
    b .L_84
    b .L_6c
.L_6c:
    mov r0, #0x0
    str r0, [r1, #0x5ac]
    strh r0, [r5, #0x8]
    strh r0, [r5, #0xa]
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_84:
    mov r0, r4
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x78
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_ov002_021bc538
    cmp r0, #0x0
    moveq r0, #0x78
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5]
    mov r0, r4
    mov r2, #0x0
    bl func_ov002_022535a4
    cmp r0, #0x0
    moveq r0, #0x79
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5]
    mov r0, r4
    mov r2, #0x0
    bl func_ov002_0226b0a4
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_e0:
    ldr r0, _LIT2
    add r1, r5, r4, lsl #0x1
    ldrh r2, [r0, #0xb2]
    mov r0, #0x78
    strh r2, [r1, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_f8:
    rsb r0, r4, #0x1
    bl func_ov002_0226af64
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, pc}
.L_108:
    add r0, r2, #0x1
    str r0, [r1, #0x5ac]
    cmp r0, #0x2
    movlt r0, #0x7f
    ldmltia sp!, {r3, r4, r5, pc}
    mov r0, #0x0
    str r0, [r1, #0x5ac]
    bl func_ov002_021e2a4c
    mov r0, #0x77
    ldmia sp!, {r3, r4, r5, pc}
.L_130:
    add r0, r5, r4, lsl #0x1
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_164
    bl func_ov002_021b9a84
    ldrh r2, [r5]
    mov r1, r0
    mov r0, r4
    mov r4, r2, lsl #0x10
    mov r2, #0x1
    mov r3, #0x0
    str r4, [sp]
    bl func_ov002_0227ab74
.L_164:
    ldr r0, _LIT0
    ldr r1, [r0, #0x5ac]
    add r1, r1, #0x1
    str r1, [r0, #0x5ac]
    cmp r1, #0x2
    movlt r0, #0x77
    movge r0, #0x6e
    ldmia sp!, {r3, r4, r5, pc}
.L_184:
    bl func_ov002_021e277c
    ldr r0, _LIT1
    ldr r0, [r0, #0xcec]
    rsb r0, r0, #0x1
    bl func_ov002_021e277c
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_1a4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022d0d8c
