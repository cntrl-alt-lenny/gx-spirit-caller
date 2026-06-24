; func_0204b39c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .extern func_0204b7dc
        .extern func_0204bbd8
        .extern func_0204bed0
        .extern func_02092fc8
        .extern func_020b3714
        .global func_0204b39c
        .arm
func_0204b39c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x8
    beq .L_38
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0xe
    beq .L_38
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0xf
    bne .L_7c
.L_38:
    bl func_02092fc8
    mov r4, r0
    mov r5, r1
    bl func_0204987c
    ldr r1, [r0, #0x1e0]
    ldr r0, [r0, #0x1e4]
    subs r3, r4, r1
    sbc r0, r5, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3714
    mov r4, r0
    mov r5, r1
    b .L_88
.L_7c:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_88:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x8
    beq .L_ac
    cmp r0, #0xe
    beq .L_e0
    cmp r0, #0xf
    beq .L_1e8
    b .L_208
.L_ac:
    ldr r0, _LIT1
    cmp r5, #0x0
    cmpeq r4, r0
    bls .L_208
    bl func_0204987c
    ldr r0, [r0, #0xf4]
    mov r1, #0xe
    bl func_0204b7dc
    cmp r0, #0x0
    bne .L_208
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_e0:
    ldr r0, _LIT1
    cmp r5, #0x0
    cmpeq r4, r0
    bls .L_208
    bl func_0204987c
    ldrb r1, [r0, #0x1a4]
    add r1, r1, #0x1
    strb r1, [r0, #0x1a4]
    bl func_0204987c
    ldrb r0, [r0, #0x1a4]
    cmp r0, #0x5
    bls .L_16c
    bl func_0204987c
    ldr r0, [r0, #0x1d0]
    bl func_0204bbd8
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_160
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x1a4]
    bl func_0204987c
    mov r4, r0
    bl func_02092fc8
    str r0, [r4, #0x1e0]
    str r1, [r4, #0x1e4]
    b .L_208
.L_160:
    mov r0, #0x2
    bl func_0204bed0
    b .L_208
.L_16c:
    mov r4, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_208
    mov r5, #0xd
    mov r6, r4
.L_188:
    bl func_0204987c
    mov r7, r0
    bl func_0204987c
    add r0, r0, r4
    ldrb r0, [r0, #0x2c8]
    ldr r1, [r7, #0x1d0]
    mov r0, r6, lsl r0
    ands r0, r1, r0
    bne .L_1d0
    bl func_0204987c
    add r0, r0, r4, lsl #0x2
    ldr r0, [r0, #0xf4]
    mov r1, r5
    bl func_0204b7dc
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
.L_1d0:
    add r4, r4, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r4, r0
    ble .L_188
    b .L_208
.L_1e8:
    bl func_0204987c
    add r0, r0, #0x100
    ldrh r0, [r0, #0xaa]
    cmp r5, r0, asr #0x1f
    cmpeq r4, r0
    bls .L_208
    mov r0, #0x2
    bl func_0204bed0
.L_208:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0x000082ea
_LIT1: .word 0x00001770
