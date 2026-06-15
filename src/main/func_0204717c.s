; func_0204717c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219daec
        .extern func_02045280
        .extern func_0204550c
        .extern func_02046094
        .extern func_020461fc
        .extern func_0204653c
        .extern func_020466f4
        .extern func_02046714
        .extern func_020480b4
        .extern func_02048124
        .extern func_0204823c
        .extern func_020491ec
        .extern func_020492d0
        .extern func_02049430
        .extern func_020507b4
        .extern func_02052424
        .extern func_02053774
        .extern func_02055f84
        .extern func_02056068
        .extern func_02067354
        .global func_0204717c
        .arm
func_0204717c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0204550c
    cmp r0, #0x0
    beq .L_50c
    bl func_02046714
.L_50c:
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    bl func_02045280
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x24]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_714
    b .L_714
    b .L_574
    b .L_6a4
    b .L_6ac
    b .L_6ac
    b .L_6bc
    b .L_6cc
.L_574:
    bl func_02053774
    cmp r0, #0x1
    beq .L_594
    cmp r0, #0x2
    beq .L_67c
    cmp r0, #0x3
    beq .L_690
    b .L_714
.L_594:
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0]
    ldr r1, [r0, #0xa0]
    add r0, r0, #0x1c
    bl func_02056068
    bl func_0204653c
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    ldr r2, _LIT1
    mov r3, r1
    add r0, r0, #0x1c
    bl func_02055f84
    bl func_0204653c
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    ldr r0, _LIT0
    ldr r2, _LIT2
    ldr r0, [r0]
    mov r1, #0x3
    add r0, r0, #0x1c
    mov r3, #0x0
    bl func_02055f84
    bl func_0204653c
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    ldr r0, _LIT0
    ldr r2, _LIT3
    ldr r0, [r0]
    mov r1, #0x1
    add r0, r0, #0x1c
    mov r3, #0x0
    bl func_02055f84
    bl func_0204653c
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    ldr r0, _LIT0
    ldr r2, _LIT4
    ldr r0, [r0]
    mov r1, #0x2
    add r0, r0, #0x1c
    mov r3, #0x0
    bl func_02055f84
    bl func_0204653c
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    mov r0, #0x2
    bl func_020466f4
    bl func_0204823c
    b .L_714
.L_67c:
    ldr r1, _LIT5
    mov r0, #0x3
    bl func_020480b4
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_690:
    ldr r1, _LIT6
    mov r0, #0x4
    bl func_020480b4
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_6a4:
    bl func_02048124
    b .L_714
.L_6ac:
    bl func_02049430
    mov r0, #0x0
    bl func_020507b4
    b .L_714
.L_6bc:
    mov r0, #0x1
    bl func_020507b4
    bl func_02049430
    b .L_714
.L_6cc:
    bl func_02052424
    bl func_02049430
    ldr r0, _LIT0
    ldr r1, [r0]
    ldrb r0, [r1, #0x369]
    cmp r0, #0x2
    beq .L_6f4
    ldrb r0, [r1, #0x369]
    cmp r0, #0x3
    bne .L_700
.L_6f4:
    mov r0, #0x1
    bl func_020507b4
    b .L_714
.L_700:
    ldr r0, [r1]
    cmp r0, #0x0
    beq .L_714
    mov r0, #0x0
    bl func_020507b4
.L_714:
    ldr r0, _LIT0
    ldr r1, [r0]
    ldrb r0, [r1, #0x36c]
    cmp r0, #0x1
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    ldr r0, [r1, #0x364]
    cmp r0, #0x0
    beq .L_74c
    bl func_02067354
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x364]
.L_74c:
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    strb r1, [r0, #0x36c]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219daec
_LIT1: .word func_020461fc
_LIT2: .word func_02046094
_LIT3: .word func_020492d0
_LIT4: .word func_020491ec
_LIT5: .word 0xffffb172
_LIT6: .word 0xffffb17b
