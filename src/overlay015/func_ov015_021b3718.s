; func_ov015_021b3718 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_02105989
        .extern Strlen
        .extern func_020a6afc
        .global func_ov015_021b3718
        .arm
func_ov015_021b3718:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, r1
    ldrsb r1, [r5]
    mov r6, r0
    mov r4, #0x0
    cmp r1, #0x0
    beq .L_d4
    ldr r8, _LIT0
    ldr r7, _LIT1
.L_24:
    ldr r0, [r7, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_60
    tst r1, #0x80
    beq .L_60
    cmp r6, #0x0
    beq .L_54
    strb r1, [r6]
    ldrsb r0, [r5, #0x1]
    strb r0, [r6, #0x1]
    add r6, r6, #0x2
.L_54:
    add r5, r5, #0x2
    add r4, r4, #0x2
    b .L_c8
.L_60:
    cmp r1, #0x5e
    bne .L_b8
    ldrsb r0, [r5, #0x1]
    cmp r0, #0x70
    bne .L_a4
    mov r0, r8
    bl Strlen
    mov r9, r0
    cmp r6, #0x0
    beq .L_98
    mov r0, r6
    mov r1, r8
    bl func_020a6afc
    add r6, r6, r9
.L_98:
    add r4, r4, r9
    add r5, r5, #0x2
    b .L_c8
.L_a4:
    cmp r6, #0x0
    strneb r1, [r6], #0x1
    add r5, r5, #0x1
    add r4, r4, #0x1
    b .L_c8
.L_b8:
    cmp r6, #0x0
    strneb r1, [r6], #0x1
    add r5, r5, #0x1
    add r4, r4, #0x1
.L_c8:
    ldrsb r1, [r5]
    cmp r1, #0x0
    bne .L_24
.L_d4:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_02105989
_LIT1: .word data_02104f4c
