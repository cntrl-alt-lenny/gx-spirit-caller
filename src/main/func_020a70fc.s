; func_020a70fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a6ce0
        .extern func_020a6dc4
        .global func_020a70fc
        .arm
func_020a70fc:
    stmdb sp!, {r4, lr}
    movs r4, r0
    bne .L_34c
    bl func_020a6ce0
    ldmia sp!, {r4, pc}
.L_34c:
    ldrb r0, [r4, #0xd]
    cmp r0, #0x0
    bne .L_368
    ldr r0, [r4, #0x4]
    mov r1, r0, lsl #0x16
    movs r1, r1, lsr #0x1d
    bne .L_370
.L_368:
    mvn r0, #0x0
    ldmia sp!, {r4, pc}
.L_370:
    mov r0, r0, lsl #0x1b
    mov r0, r0, lsr #0x1d
    cmp r0, #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x8]
    mov r1, r0, lsl #0x1d
    mov r1, r1, lsr #0x1d
    cmp r1, #0x3
    biccs r0, r0, #0x7
    orrcs r0, r0, #0x2
    strcs r0, [r4, #0x8]
    ldr r0, [r4, #0x8]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    cmp r0, #0x2
    moveq r0, #0x0
    streq r0, [r4, #0x28]
    ldr r0, [r4, #0x8]
    mov r1, r0, lsl #0x1d
    mov r1, r1, lsr #0x1d
    cmp r1, #0x1
    beq .L_3dc
    bic r0, r0, #0x7
    str r0, [r4, #0x8]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_3dc:
    mov r0, r4
    mov r1, #0x0
    bl func_020a6dc4
    cmp r0, #0x0
    mov r0, #0x0
    beq .L_408
    mov r1, #0x1
    strb r1, [r4, #0xd]
    str r0, [r4, #0x28]
    sub r0, r0, #0x1
    ldmia sp!, {r4, pc}
.L_408:
    ldr r1, [r4, #0x8]
    bic r1, r1, #0x7
    str r1, [r4, #0x8]
    str r0, [r4, #0x18]
    str r0, [r4, #0x28]
    ldmia sp!, {r4, pc}
