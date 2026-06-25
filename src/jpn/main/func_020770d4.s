; func_020770d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee00
        .extern data_0219ee2c
        .extern func_020779cc
        .extern func_02077a04
        .extern func_02078e20
        .extern func_02078e68
        .extern func_02079394
        .extern func_020a734c
        .global func_020770d4
        .arm
func_020770d4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    mov r8, r0
    ldr r0, [r8, #0x5a4]
    mov r7, r1
    cmp r0, #0x0
    beq .L_58
    ldr r0, [r8, #0x5a8]
    cmp r0, #0x0
    beq .L_58
    ldr r0, [r7, #0x10]
    cmp r0, #0x0
    beq .L_58
    ldr r0, [r7, #0xc]
    cmp r0, #0x0
    beq .L_58
    ldr r0, [r7, #0x8]
    cmp r0, #0x0
    beq .L_58
    ldr r0, [r7, #0x4]
    cmp r0, #0x0
    bne .L_68
.L_58:
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
.L_68:
    mov r0, r0, lsl #0x1
    ldr r1, _LIT0
    add r0, r0, r0, lsr #0x1f
    mov r4, r0, asr #0x1
    ldr r1, [r1]
    mov r0, r4, lsl #0x3
    blx r1
    movs r6, r0
    addeq sp, sp, #0x8
    moveq r0, #0x2
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bxeq lr
    add r5, r6, r4, lsl #0x1
    add sl, r5, r4, lsl #0x1
    ldr r1, [r8, #0x5a4]
    ldr r2, [r8, #0x5a8]
    mov r0, r5
    mov r3, r4
    add r9, sl, r4, lsl #0x1
    bl func_02078e68
    ldr r1, [r7, #0x10]
    ldr r2, [r7, #0xc]
    mov r0, sl
    mov r3, r4
    bl func_02078e68
    mov r0, r9
    ldr r1, [r7, #0x8]
    ldr r2, [r7, #0x4]
    mov r3, r4
    bl func_02078e68
    bl func_02077a04
    str r9, [sp]
    mov r2, sl
    mov r9, r0
    mov r0, r6
    mov r1, r5
    mov r3, r4
    bl func_02079394
    mov r0, r9
    bl func_020779cc
    mov r0, r5
    mov r1, r6
    ldr r2, [r7, #0x4]
    mov r3, r4
    bl func_02078e20
    ldrb r0, [r6, r4, lsl #0x1]
    mov r4, #0x0
    cmp r0, #0x0
    bne .L_138
    ldrb r0, [r5, #0x1]
    cmp r0, #0x1
    beq .L_140
.L_138:
    mov r4, #0x2
    b .L_1b0
.L_140:
    ldr r3, [r7, #0x4]
    mov r2, #0x2
    cmp r3, #0x2
    ble .L_168
.L_150:
    ldrb r0, [r5, r2]
    cmp r0, #0xff
    bne .L_168
    add r2, r2, #0x1
    cmp r2, r3
    blt .L_150
.L_168:
    add r1, r2, #0x1
    cmp r1, r3
    bge .L_1ac
    ldrb r0, [r5, r2]
    cmp r0, #0x0
    bne .L_1ac
    ldrb r0, [r5, r1]
    cmp r0, #0x30
    bne .L_1ac
    ldr r0, _LIT1
    ldr r2, [r8, #0x47c]
    add r1, r5, r3
    add r0, r8, r0
    sub r1, r1, r2
    bl func_020a734c
    cmp r0, #0x0
    beq .L_1b0
.L_1ac:
    mov r4, #0x2
.L_1b0:
    ldr r1, _LIT2
    mov r0, r6
    ldr r1, [r1]
    blx r1
    mov r0, r4
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
_LIT0: .word data_0219ee00
_LIT1: .word 0x00000468
_LIT2: .word data_0219ee2c
