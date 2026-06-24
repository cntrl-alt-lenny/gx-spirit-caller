; func_02047110 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da0c
        .extern func_02045230
        .extern func_02045fec
        .extern func_02046154
        .extern func_02046494
        .extern func_0204664c
        .extern func_0204666c
        .extern func_02046670
        .extern func_02048040
        .extern func_020480b0
        .extern func_020481c8
        .extern func_02049178
        .extern func_0204925c
        .extern func_020493bc
        .extern func_02050740
        .extern func_020523b0
        .extern func_02053700
        .extern func_02055f10
        .extern func_02055ff4
        .extern func_020672e0
        .global func_02047110
        .arm
func_02047110:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_02046670
    cmp r0, #0x0
    beq .L_18
    bl func_0204666c
.L_18:
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    bl func_02045230
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x24]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_220
    b .L_220
    b .L_80
    b .L_1b0
    b .L_1b8
    b .L_1b8
    b .L_1c8
    b .L_1d8
.L_80:
    bl func_02053700
    cmp r0, #0x1
    beq .L_a0
    cmp r0, #0x2
    beq .L_188
    cmp r0, #0x3
    beq .L_19c
    b .L_220
.L_a0:
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0]
    ldr r1, [r0, #0xa0]
    add r0, r0, #0x1c
    bl func_02055ff4
    bl func_02046494
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    ldr r2, _LIT1
    mov r3, r1
    add r0, r0, #0x1c
    bl func_02055f10
    bl func_02046494
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    ldr r0, _LIT0
    ldr r2, _LIT2
    ldr r0, [r0]
    mov r1, #0x3
    add r0, r0, #0x1c
    mov r3, #0x0
    bl func_02055f10
    bl func_02046494
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    ldr r0, _LIT0
    ldr r2, _LIT3
    ldr r0, [r0]
    mov r1, #0x1
    add r0, r0, #0x1c
    mov r3, #0x0
    bl func_02055f10
    bl func_02046494
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    ldr r0, _LIT0
    ldr r2, _LIT4
    ldr r0, [r0]
    mov r1, #0x2
    add r0, r0, #0x1c
    mov r3, #0x0
    bl func_02055f10
    bl func_02046494
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    mov r0, #0x2
    bl func_0204664c
    bl func_020481c8
    b .L_220
.L_188:
    ldr r1, _LIT5
    mov r0, #0x3
    bl func_02048040
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_19c:
    ldr r1, _LIT6
    mov r0, #0x4
    bl func_02048040
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_1b0:
    bl func_020480b0
    b .L_220
.L_1b8:
    bl func_020493bc
    mov r0, #0x0
    bl func_02050740
    b .L_220
.L_1c8:
    mov r0, #0x1
    bl func_02050740
    bl func_020493bc
    b .L_220
.L_1d8:
    bl func_020523b0
    bl func_020493bc
    ldr r0, _LIT0
    ldr r1, [r0]
    ldrb r0, [r1, #0x369]
    cmp r0, #0x2
    beq .L_200
    ldrb r0, [r1, #0x369]
    cmp r0, #0x3
    bne .L_20c
.L_200:
    mov r0, #0x1
    bl func_02050740
    b .L_220
.L_20c:
    ldr r0, [r1]
    cmp r0, #0x0
    beq .L_220
    mov r0, #0x0
    bl func_02050740
.L_220:
    ldr r0, _LIT0
    ldr r1, [r0]
    ldrb r0, [r1, #0x36c]
    cmp r0, #0x1
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    ldr r0, [r1, #0x364]
    cmp r0, #0x0
    beq .L_258
    bl func_020672e0
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x364]
.L_258:
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    strb r1, [r0, #0x36c]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219da0c
_LIT1: .word func_02046154
_LIT2: .word func_02045fec
_LIT3: .word func_0204925c
_LIT4: .word func_02049178
_LIT5: .word 0xffffb172
_LIT6: .word 0xffffb17b
