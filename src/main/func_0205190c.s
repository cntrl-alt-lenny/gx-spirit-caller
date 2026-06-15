; func_0205190c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc84
        .extern data_0219dc8c
        .extern func_020454cc
        .extern func_020498f0
        .extern func_020930b0
        .global func_0205190c
        .arm
func_0205190c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    bl func_020498f0
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, pc}
    cmp r4, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x3
    ldmeqia sp!, {r4, r5, pc}
    cmp r5, #0x0
    beq .L_1814
    cmp r5, #0x1
    beq .L_18fc
    b .L_1930
.L_1814:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x13
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, pc}
    ldrb r0, [r4]
    cmp r0, #0x0
    beq .L_184c
    ldrb r0, [r4, #0x1]
    cmp r0, #0x1
    addls sp, sp, #0x4
    movls r0, #0x3
    ldmlsia sp!, {r4, r5, pc}
.L_184c:
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_1880
    mov r0, #0x4
    mov r1, #0x20
    bl func_020454cc
    ldr r1, _LIT0
    cmp r0, #0x0
    str r0, [r1]
    addeq sp, sp, #0x4
    moveq r0, #0x4
    ldmeqia sp!, {r4, r5, pc}
.L_1880:
    ldrb r2, [r4]
    ldr r1, _LIT0
    mov r3, #0x0
    strb r2, [r0]
    ldrb r2, [r4, #0x1]
    ldr r0, [r1]
    strb r2, [r0, #0x1]
    ldr r0, [r1]
    strb r3, [r0, #0x2]
    ldr r0, [r1]
    strb r3, [r0, #0x3]
    ldr r2, [r4, #0x4]
    ldr r0, [r1]
    str r2, [r0, #0x4]
    ldr r0, [r1]
    str r3, [r0, #0x8]
    ldr r0, [r1]
    str r3, [r0, #0xc]
    bl func_020930b0
    ldr r2, _LIT0
    ldr r2, [r2]
    str r0, [r2, #0x10]
    str r1, [r2, #0x14]
    bl func_020930b0
    ldr r2, _LIT0
    add sp, sp, #0x4
    ldr r2, [r2]
    str r0, [r2, #0x18]
    str r1, [r2, #0x1c]
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_18fc:
    ldr r0, [r4]
    add sp, sp, #0x4
    cmp r0, #0x0
    ldrne r0, _LIT1
    movne r1, #0x1
    strneb r1, [r0]
    ldreq r0, _LIT1
    moveq r1, #0x0
    streqb r1, [r0]
    ldr r1, _LIT1
    mov r0, #0x0
    strb r0, [r1, #0x1]
    ldmia sp!, {r4, r5, pc}
.L_1930:
    mov r0, #0x2
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219dc84
_LIT1: .word data_0219dc8c
