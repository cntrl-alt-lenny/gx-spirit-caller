; func_020769e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02076b64
        .extern func_02076b74
        .extern func_02077cc8
        .extern func_02094688
        .global func_020769e8
        .arm
func_020769e8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    mov r4, r0
    ldrb r0, [r6]
    ldrb r1, [r6, #0x1]
    bl func_02076b64
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    add r0, r6, #0x2
    add r1, r4, #0x34
    mov r2, #0x20
    bl func_02094688
    ldrb r5, [r6, #0x22]
    add r6, r6, #0x23
    cmp r5, #0x20
    movne r0, #0x0
    strneb r0, [r4, #0x30]
    bne .L_36c
    mov r0, r6
    add r1, r4, #0x74
    mov r2, #0x20
    bl func_02094688
    mov r0, r4
    bl func_02077cc8
.L_36c:
    add r0, r6, r5
    ldrb r1, [r0, #0x1]
    ldrb r3, [r6, r5]
    add r0, r0, #0x2
    mov r2, #0x2
    add r1, r1, r3, lsl #0x8
    add r1, r1, r1, lsr #0x1f
    mov r1, r1, asr #0x1
    bl func_02076b74
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    strh r0, [r4, #0x32]
    movne r0, #0x1
    strneb r0, [r4, #0x455]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
