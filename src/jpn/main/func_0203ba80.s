; func_0203ba80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020beb28
        .extern data_0219d8c8
        .extern func_02088458
        .extern func_02088c94
        .global func_0203ba80
        .arm
func_0203ba80:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r1, #0xff
    mov sl, r0
    strb r1, [sl, #0xaf]
    strb r1, [sl, #0xae]
    ldrh r7, [sl, #0xb8]
    ldr r8, _LIT0
    subs r6, r7, #0x1
    bmi .L_78
    ldr r5, _LIT1
    mov r4, #0x1
.L_2c:
    mov r9, r5
    bl func_02088c94
    cmp r0, #0x0
    addne r9, r5, #0x11
.L_3c:
    ldrb r1, [r9]
    cmp r1, #0xff
    beq .L_70
    ldrsb r0, [r8, r1]
    cmp r0, #0x0
    bne .L_68
    strb r4, [r8, r1]
    add r0, sl, r6
    strb r1, [r0, #0xae]
    sub r7, r7, #0x1
    b .L_70
.L_68:
    add r9, r9, #0x1
    b .L_3c
.L_70:
    subs r6, r6, #0x1
    bpl .L_2c
.L_78:
    cmp r7, #0x0
    beq .L_b4
    ldrb r1, [sl, #0xaf]
    cmp r1, #0xff
    movne r0, #0x0
    strneb r0, [r8, r1]
    ldrb r1, [sl, #0xae]
    cmp r1, #0xff
    movne r0, #0x0
    strneb r0, [r8, r1]
    mov r0, #0xff
    strb r0, [sl, #0xaf]
    strb r0, [sl, #0xae]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_b4:
    ldrh r1, [sl, #0xb8]
    add r0, sl, #0x4
    add r2, sl, #0xae
    bl func_02088458
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219d8c8
_LIT1: .word data_020beb28
