; func_020a16f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a98fc
        .extern func_02094504
        .extern func_020945f4
        .extern func_020a0978
        .extern func_020a0a4c
        .extern func_020a112c
        .extern func_020a1bf8
        .extern func_020a323c
        .extern func_020a33a8
        .extern func_020a3654
        .extern func_020a36b4
        .extern func_020a36c8
        .extern func_020a5d08
        .global func_020a16f4
        .arm
func_020a16f4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r6, r0
    mov r4, r1
    cmp r6, #0x19
    bgt .L_d90
    cmp r6, #0x19
    bge .L_fd8
    cmp r6, #0x11
    bgt .L_d84
    cmp r6, #0x11
    bge .L_1190
    cmp r6, #0x3
    bgt .L_1190
    cmp r6, #0x0
    blt .L_1190
    cmp r6, #0x0
    beq .L_dcc
    cmp r6, #0x1
    beq .L_df0
    cmp r6, #0x3
    beq .L_fcc
    b .L_1190
.L_d84:
    cmp r6, #0x15
    beq .L_db8
    b .L_1190
.L_d90:
    cmp r6, #0xff
    bgt .L_dac
    cmp r6, #0xff
    bge .L_107c
    cmp r6, #0x1c
    beq .L_fe0
    b .L_1190
.L_dac:
    cmp r6, #0x100
    beq .L_10ec
    b .L_1190
.L_db8:
    mov r2, r4
    mov r0, #0x0
    mov r1, #0x1
    bl func_020a1bf8
    b .L_1190
.L_dcc:
    ldrh r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_1190
    cmp r0, #0x10
    bcs .L_1190
    mov r2, r4
    mov r1, #0x2
    bl func_020a1bf8
    b .L_1190
.L_df0:
    ldrh r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_1190
    cmp r0, #0x10
    bcs .L_1190
    ldr r2, _LIT0
    sub r0, r0, #0x1
    ldr r3, [r2]
    mov r1, #0x0
    add r0, r3, r0, lsl #0x1
    add r0, r0, #0x1400
    strh r1, [r0, #0x8a]
    ldrh r3, [r4, #0x10]
    ldr r5, [r2]
    ldr r0, _LIT1
    sub r2, r3, #0x1
    add r0, r5, r0
    add r0, r0, r2, lsl #0x2
    mov r2, #0x4
    bl func_020945f4
    ldr r0, _LIT0
    ldrh r1, [r4, #0x10]
    ldr r0, [r0]
    mov r2, #0x16
    add r0, r0, #0x1340
    sub r1, r1, #0x1
    mla r0, r1, r2, r0
    mov r1, #0x0
    bl func_020945f4
    ldrh r0, [r4, #0x10]
    bl func_020a5d08
    ldrh r1, [r4, #0x10]
    ldr r0, _LIT0
    mov r3, #0x0
    ldr r2, [r0]
    sub r1, r1, #0x1
    add r1, r2, r1, lsl #0x1
    add r1, r1, #0x1700
    strh r3, [r1, #0x54]
    ldrh r8, [r4, #0x10]
    ldr r5, [r0]
    mvn r1, #0x0
    sub r7, r8, #0x1
    add r2, r5, r7
    add r2, r2, #0x1500
    ldrsb r3, [r2, #0x26]
    cmp r3, r1
    beq .L_f18
    ldr r2, _LIT2
    and r3, r3, #0xff
    mul r2, r3, r2
    add r3, r5, r2
    add r9, r3, #0x1d00
    mov r5, #0x1
    ldrh sl, [r9, #0x4e]
    mvn r3, r5, lsl r8
    and sl, sl, r3
    strh sl, [r9, #0x4e]
    ldr r9, [r0]
    add r9, r9, r2
    add r9, r9, #0x1d00
    ldrh sl, [r9, #0x50]
    orr r5, sl, r5, lsl r8
    strh r5, [r9, #0x50]
    ldr r5, [r0]
    add r5, r5, r7
    add r5, r5, #0x1000
    strb r1, [r5, #0x526]
    ldr r0, [r0]
    add r0, r0, r2
    add r0, r0, #0x1d00
    ldrh r1, [r0, #0x4c]
    and r1, r1, r3
    strh r1, [r0, #0x4c]
.L_f18:
    ldr r1, _LIT0
    ldrh r2, [r4, #0x10]
    ldr r7, [r1]
    mov r3, #0x1
    add r0, r7, #0x1500
    ldrh r5, [r0, #0x36]
    mov r0, r3, lsl r2
    ands r0, r5, r0
    beq .L_f68
    add r0, r7, #0x1000
    ldrb r2, [r0, #0x535]
    sub r2, r2, #0x1
    strb r2, [r0, #0x535]
    ldr r0, [r1]
    ldrh r1, [r4, #0x10]
    add r0, r0, #0x1500
    ldrh r2, [r0, #0x36]
    mvn r1, r3, lsl r1
    and r1, r2, r1
    strh r1, [r0, #0x36]
.L_f68:
    ldrh r0, [r4, #0x10]
    ldr r1, _LIT0
    ldr r2, [r1]
    sub r1, r0, #0x1
    add r1, r2, r1, lsl #0x2
    add r1, r1, #0x1000
    ldr r1, [r1, #0x4e8]
    cmp r1, #0x8
    bne .L_f98
    mov r1, #0x9
    mov r2, #0x0
    bl func_020a1bf8
.L_f98:
    ldrh r0, [r4, #0x10]
    mov r2, r4
    mov r1, #0x3
    bl func_020a1bf8
    ldrh r1, [r4, #0x10]
    ldr r0, _LIT0
    mov r3, #0x0
    ldr r2, [r0]
    sub r0, r1, #0x1
    add r0, r2, r0, lsl #0x2
    add r0, r0, #0x1000
    str r3, [r0, #0x4e8]
    b .L_1190
.L_fcc:
    mov r0, r4
    bl func_020a112c
    b .L_1190
.L_fd8:
    bl func_020a0a4c
    b .L_1190
.L_fe0:
    mov r5, #0x0
    ldr r9, _LIT0
    ldr r7, _LIT3
    ldr r8, _LIT2
    mov sl, r5
.L_ff4:
    mul r4, r5, r8
    ldr r1, [r9]
    add r2, r1, r4
    add r0, r2, #0x1000
    ldrb r0, [r0, #0xd52]
    cmp r0, #0x0
    beq .L_1044
    add r0, r2, #0x1d00
    ldrh r3, [r0, #0x50]
    cmp r3, #0x0
    beq .L_1044
    ldrh r2, [r0, #0x4e]
    add r0, r1, r7
    add r0, r0, r4
    add r1, r1, #0x1340
    bl func_020a33a8
    ldr r0, [r9]
    add r0, r0, r4
    add r0, r0, #0x1d00
    strh sl, [r0, #0x50]
.L_1044:
    add r0, r5, #0x1
    and r5, r0, #0xff
    cmp r5, #0x10
    bcc .L_ff4
    bl func_020a36c8
    mov r5, r0
    bl func_020a36b4
    mov r4, r0
    bl func_020a3654
    mov r2, r0
    mov r0, r5
    mov r1, r4
    bl func_020a323c
    b .L_1190
.L_107c:
    ldrh r0, [r4, #0x2]
    cmp r0, #0xf
    addls pc, pc, r0, lsl #0x2
    b .L_10dc
    b .L_10dc
    b .L_10cc
    b .L_10dc
    b .L_10dc
    b .L_10cc
    b .L_10cc
    b .L_10cc
    b .L_10dc
    b .L_10cc
    b .L_10cc
    b .L_10dc
    b .L_10dc
    b .L_10dc
    b .L_10dc
    b .L_10dc
    b .L_10dc
.L_10cc:
    mov r0, #0x0
    mov r1, #0x9
    bl func_020a0978
    b .L_1190
.L_10dc:
    mov r0, #0x0
    mov r1, #0x8
    bl func_020a0978
    b .L_1190
.L_10ec:
    ldrh r0, [r4]
    cmp r0, #0x1d
    addls pc, pc, r0, lsl #0x2
    b .L_1184
    b .L_1174
    b .L_1184
    b .L_1184
    b .L_1184
    b .L_1184
    b .L_1184
    b .L_1184
    b .L_1174
    b .L_1174
    b .L_1184
    b .L_1184
    b .L_1184
    b .L_1184
    b .L_1174
    b .L_1174
    b .L_1174
    b .L_1184
    b .L_1174
    b .L_1174
    b .L_1184
    b .L_1184
    b .L_1174
    b .L_1184
    b .L_1184
    b .L_1184
    b .L_1174
    b .L_1184
    b .L_1184
    b .L_1184
    b .L_1174
.L_1174:
    mov r0, #0x0
    mov r1, #0x9
    bl func_020a0978
    b .L_1190
.L_1184:
    mov r0, #0x0
    mov r1, #0x8
    bl func_020a0978
.L_1190:
    cmp r6, #0x11
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bxne lr
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r1, [r1]
    mov r2, #0x7d00
    add r3, r1, #0x1000
    ldr r4, [r3, #0x4e4]
    bl func_02094504
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [r1]
    cmp r4, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bxeq lr
    mov r2, r0
    mov r1, #0xc
    blx r4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
_LIT0: .word data_021a98fc
_LIT1: .word 0x000014a8
_LIT2: .word 0x000005d4
_LIT3: .word 0x0000186c
