; func_ov002_021d2d88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdc88
        .extern data_ov002_022ce950
        .extern data_ov002_022cf180
        .extern data_ov002_022d0250
        .extern func_ov002_021b947c
        .extern func_ov002_021b99b4
        .extern func_ov002_021b9b64
        .extern func_ov002_021c2c54
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021d2d88
        .arm
func_ov002_021d2d88:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r7, #0x1
    ldr r1, [r0, #0x810]
    moveq r7, #0x0
    ldrh r4, [r0, #0x2]
    cmp r1, #0x0
    ldrh r5, [r0, #0x4]
    ldrh r6, [r0, #0x6]
    beq .L_48
    cmp r1, #0x1
    beq .L_180
    cmp r1, #0x2
    beq .L_1c8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_48:
    mov r0, r6
    bl func_ov002_021b9b64
    cmp r0, #0x0
    beq .L_68
    ldr r0, [r0]
    ldr r1, _LIT1
    str r0, [r1, r5, lsl #0x2]
    b .L_c0
.L_68:
    ldr r0, _LIT2
    mov r1, r6, lsl #0x2
    ldrh r3, [r0, r1]
    mov r0, #0x0
    ldr r2, _LIT3
    sub r1, r0, #0x2000
    mov r3, r3, lsl #0x13
    and ip, r1, #0x0
    and r1, r2, r3, lsr #0x13
    orr r3, ip, r1
    bic ip, r3, #0x2000
    mov r3, r6, lsl #0x1f
    orr r3, ip, r3, lsr #0x12
    add r1, sp, #0x0
    mov r2, r6, asr #0x1
    bic ip, r3, #0x3fc00000
    mov r3, r2, lsl #0x18
    ldr r2, _LIT1
    orr r3, ip, r3, lsr #0x2
    str r0, [r1]
    str r3, [sp]
    str r3, [r2, r5, lsl #0x2]
.L_c0:
    cmp r4, #0x10
    bne .L_114
    mov r0, r6
    bl func_ov002_021b947c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    sub r0, r0, #0xe
    cmp r0, #0x1
    bhi .L_104
    mov r0, r6
    bl func_ov002_021b9b64
    ldr r1, [r0]
    bic r1, r1, #0x18000
    orr r1, r1, #0x8000
    str r1, [r0]
.L_104:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_114:
    ldr r0, _LIT0
    cmp r4, #0xe
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    bne .L_180
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b99b4
    ldr r1, _LIT4
    and r2, r7, #0x1
    mul r3, r2, r1
    ldr r1, _LIT5
    ldr r1, [r1, r3]
    sub r1, r1, #0x1
    cmp r1, r0
    beq .L_180
    mov r1, r6, lsl #0x10
    mov r0, r7
    mov r1, r1, lsr #0x10
    bl func_ov002_021c2c54
    mov r1, r7
    mov r2, r4
    mov r3, r6
    mov r0, #0x16
    bl func_ov002_0229ade0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_180:
    mov r0, #0x16
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r5, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r3, r1, lsl #0x10
    mov r0, r6, lsl #0x10
    orr r3, r3, r0, lsr #0x10
    mov r1, r7
    mov r2, r4
    mov r0, #0x2d
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1c8:
    mov r0, #0x2d
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word data_ov002_022cdc88
_LIT2: .word data_ov002_022d0250
_LIT3: .word 0x00001fff
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf180
