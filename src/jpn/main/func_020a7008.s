; func_020a7008 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a6bec
        .extern func_020a6cd0
        .global func_020a7008
        .arm
func_020a7008:
    stmdb sp!, {r4, lr}
    movs r4, r0
    bne .L_2c4
    bl func_020a6bec
    ldmia sp!, {r4, pc}
.L_2c4:
    ldrb r0, [r4, #0xd]
    cmp r0, #0x0
    bne .L_2e0
    ldr r0, [r4, #0x4]
    mov r1, r0, lsl #0x16
    movs r1, r1, lsr #0x1d
    bne .L_2e8
.L_2e0:
    mvn r0, #0x0
    ldmia sp!, {r4, pc}
.L_2e8:
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
    beq .L_354
    bic r0, r0, #0x7
    str r0, [r4, #0x8]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_354:
    mov r0, r4
    mov r1, #0x0
    bl func_020a6cd0
    cmp r0, #0x0
    mov r0, #0x0
    beq .L_380
    mov r1, #0x1
    strb r1, [r4, #0xd]
    str r0, [r4, #0x28]
    sub r0, r0, #0x1
    ldmia sp!, {r4, pc}
.L_380:
    ldr r1, [r4, #0x8]
    bic r1, r1, #0x7
    str r1, [r4, #0x8]
    str r0, [r4, #0x18]
    str r0, [r4, #0x28]
    ldmia sp!, {r4, pc}
