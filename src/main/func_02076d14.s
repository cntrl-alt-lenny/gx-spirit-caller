; func_02076d14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02077b98
        .extern func_02094688
        .extern func_020a7440
        .global func_02076d14
        .arm
func_02076d14:
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
    beq .L_118
    cmp r4, #0x20
    bne .L_118
    mov r1, r5
    add r0, r6, #0x74
    mov r2, #0x20
    bl func_020a7440
    cmp r0, #0x0
    moveq r0, #0x1
    streqb r0, [r6, #0x31]
    beq .L_158
.L_118:
    cmp r7, #0x0
    beq .L_128
    mov r0, r6
    bl func_02077b98
.L_128:
    cmp r4, #0x0
    moveq r0, #0x0
    streqb r0, [r6, #0x30]
    beq .L_150
    mov r0, r5
    add r1, r6, #0x74
    mov r2, #0x20
    bl func_02094688
    mov r0, #0x1
    strb r0, [r6, #0x30]
.L_150:
    mov r0, #0x0
    strb r0, [r6, #0x31]
.L_158:
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
