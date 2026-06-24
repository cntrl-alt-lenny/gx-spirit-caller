; func_02076c2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02077ab0
        .extern func_02094688
        .extern func_020a734c
        .global func_02076c2c
        .arm
func_02076c2c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r6, r0
    mov r5, r1
    add r0, r5, #0x2
    add r1, r6, #0x54
    mov r2, #0x20
    bl func_02094688
    add r0, r5, #0x22
    ldrb r7, [r6, #0x30]
    add r5, r5, #0x23
    ldrb r4, [r0]
    cmp r7, #0x0
    beq .L_60
    cmp r4, #0x20
    bne .L_60
    mov r1, r5
    add r0, r6, #0x74
    mov r2, #0x20
    bl func_020a734c
    cmp r0, #0x0
    moveq r0, #0x1
    streqb r0, [r6, #0x31]
    beq .L_a0
.L_60:
    cmp r7, #0x0
    beq .L_70
    mov r0, r6
    bl func_02077ab0
.L_70:
    cmp r4, #0x0
    moveq r0, #0x0
    streqb r0, [r6, #0x30]
    beq .L_98
    mov r0, r5
    add r1, r6, #0x74
    mov r2, #0x20
    bl func_02094688
    mov r0, #0x1
    strb r0, [r6, #0x30]
.L_98:
    mov r0, #0x0
    strb r0, [r6, #0x31]
.L_a0:
    add r0, r5, r4
    ldrb r2, [r5, r4]
    ldrb r1, [r0, #0x1]
    mov r0, #0x2
    add r1, r1, r2, lsl #0x8
    strh r1, [r6, #0x32]
    strb r0, [r6, #0x455]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
