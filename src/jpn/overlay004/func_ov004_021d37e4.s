; func_ov004_021d37e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_ov004_0220b2a0
        .extern data_ov004_0229133c
        .extern func_020aad04
        .extern func_ov004_021d637c
        .global func_ov004_021d37e4
        .arm
func_ov004_021d37e4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    mov r7, r0
    ldr r0, [r2]
    mov r6, r1
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, [r0, #0x350]
    mov r0, r7, lsl #0x18
    add r0, r1, r0, asr #0x16
    ldrb r2, [r0, #0x1]
    cmp r2, #0x6
    bne .L_4c
    ldrb r1, [r0, #0x3]
    ldrb r0, [r0, #0x2]
    cmp r1, r0
    movcc r0, #0x1
    bcc .L_50
.L_4c:
    mov r0, #0x0
.L_50:
    cmp r0, #0x0
    beq .L_68
    cmp r6, #0x0
    movne r0, #0x6
    strne r0, [r6]
    b .L_ac
.L_68:
    cmp r2, #0x0
    bne .L_90
    cmp r6, #0x0
    beq .L_88
    mov r1, r6
    mov r0, #0x0
    mov r2, #0x20
    bl Fill32
.L_88:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_90:
    cmp r6, #0x0
    beq .L_ac
    mov r0, #0x2
    str r0, [r6]
    cmp r2, #0x2
    moveq r0, #0x3
    streq r0, [r6]
.L_ac:
    cmp r6, #0x0
    beq .L_184
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r1, [r1]
    ldr r4, _LIT1
    add r1, r1, r7, lsl #0x2
    add r1, r1, #0x300
    ldrsb r5, [r1, #0x58]
    bl func_ov004_021d637c
    ldr r0, _LIT0
    add r1, r7, r7, lsl #0x6
    ldr r7, [r0]
    add r0, r7, r1, lsl #0x2
    ldr r0, [r0, #0x548]
    cmp r0, #0x0
    beq .L_150
    mov r0, #0x54
    mul r3, r5, r0
    add r0, r4, #0x16c
    add r2, r0, #0x3c00
    add r0, r7, #0x48
    ldr r7, [r2, r3]
    add r0, r0, #0x400
    cmp r7, #0x0
    moveq r7, #0x1
    add r1, r0, r1, lsl #0x2
    movne r7, #0x0
    add r0, r4, #0x3000
    str r7, [r0, #0xcd0]
    add r0, r4, r3
    ldrb r7, [r1]
    add r0, r0, #0x3000
    strb r7, [r0, #0xd38]
    ldr r7, [r1, #0x18]
    add r0, r4, #0x39
    add r0, r0, #0x3d00
    add r0, r0, r3
    add r1, r1, #0x1
    str r7, [r2, r3]
    bl func_020aad04
.L_150:
    mov r0, #0x54
    mul r3, r5, r0
    add r0, r4, r3
    add r0, r0, #0x3000
    ldrb r2, [r0, #0xd38]
    add r1, r4, #0x39
    add r1, r1, #0x3d00
    strb r2, [r6, #0x8]
    ldr r2, [r0, #0xd6c]
    add r0, r6, #0x9
    add r1, r1, r3
    str r2, [r6, #0x4]
    bl func_020aad04
.L_184:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov004_0229133c
_LIT1: .word data_ov004_0220b2a0
