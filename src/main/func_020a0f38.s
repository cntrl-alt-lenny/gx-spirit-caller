; func_020a0f38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021026e0
        .extern data_021a98fc
        .extern func_020945f4
        .extern func_02094688
        .extern func_020a2cbc
        .extern func_020a5c80
        .global func_020a0f38
        .arm
func_020a0f38:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x1c
    mov r4, #0x0
    add r0, sp, #0x6
    mov r1, r4
    mov r2, #0x10
    mvn r5, #0x0
    bl func_020945f4
    ldr r1, _LIT0
    mov r0, #0x1
    ldr r1, [r1]
    add ip, sp, #0x6
.L_5a0:
    sub r3, r0, #0x1
    add r2, r1, r3, lsl #0x2
    add r2, r2, #0x1000
    ldr r2, [r2, #0x4e8]
    cmp r2, #0x5
    bne .L_5d0
    add r2, r1, r3
    add r2, r2, #0x1500
    ldrsb r3, [r2, #0x26]
    ldrb r2, [ip, r3]
    add r2, r2, #0x1
    strb r2, [ip, r3]
.L_5d0:
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0xf
    bls .L_5a0
    ldr r2, _LIT1
    mov r0, #0x0
    ldrb r3, [r2]
    add lr, sp, #0x6
    ldr ip, _LIT2
.L_5f8:
    add r2, r3, #0x1
    mov r3, r2, lsr #0x1f
    rsb r2, r3, r2, lsl #0x1c
    add r2, r3, r2, ror #0x1c
    and r3, r2, #0xff
    mla r2, r3, ip, r1
    add r2, r2, #0x1000
    ldrb r2, [r2, #0xd52]
    cmp r2, #0x0
    beq .L_634
    ldrb r2, [lr, r3]
    cmp r2, #0x0
    movne r0, r3, lsl #0x18
    movne r5, r0, asr #0x18
    bne .L_644
.L_634:
    add r0, r0, #0x1
    and r0, r0, #0xff
    cmp r0, #0x10
    bcc .L_5f8
.L_644:
    mvn r0, #0x0
    cmp r5, r0
    addeq sp, sp, #0x1c
    moveq r0, #0x15
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldr r2, _LIT1
    mov r0, #0x1
    strb r5, [r2]
    mov r3, r0
.L_66c:
    sub ip, r0, #0x1
    add r2, r1, ip, lsl #0x2
    add r2, r2, #0x1000
    ldr r2, [r2, #0x4e8]
    cmp r2, #0x5
    bne .L_6a0
    add r2, r1, ip
    add r2, r2, #0x1500
    ldrsb r2, [r2, #0x26]
    cmp r5, r2
    orreq r2, r4, r3, lsl r0
    moveq r2, r2, lsl #0x10
    moveq r4, r2, lsr #0x10
.L_6a0:
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0xf
    bls .L_66c
    mov r2, #0x3
    add r0, sp, #0x0
    strb r2, [sp]
    strh r5, [sp, #0x2]
    bl func_020a5c80
    movs r1, r0
    beq .L_6f0
    ldr r2, _LIT0
    ldr r0, _LIT3
    ldr r3, [r2]
    ldr r2, _LIT2
    add r0, r3, r0
    mla r0, r5, r2, r0
    mov r2, #0xe4
    bl func_02094688
.L_6f0:
    ldr r0, _LIT0
    mov r1, r4
    ldr r2, [r0]
    mov r0, #0xea
    bl func_020a2cbc
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a98fc
_LIT1: .word data_021026e0
_LIT2: .word 0x000005d4
_LIT3: .word 0x00001788
