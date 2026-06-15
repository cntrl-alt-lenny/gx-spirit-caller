; func_02075ae8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ef0c
        .extern func_02075d44
        .extern func_02076008
        .extern func_02076284
        .extern func_0207651c
        .extern func_02076ad0
        .extern func_02076d14
        .extern func_02076ddc
        .extern func_020945f4
        .global func_02075ae8
        .arm
func_02075ae8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    ldrb r0, [r8, #0x455]
    mov r7, r1
    cmp r0, #0x9
    bne .L_cc0
    ldr r1, _LIT0
    mov r0, r7
    ldr r1, [r1]
    blx r1
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_cc0:
    ldrb r2, [r7, #0x3]
    ldrb r1, [r7, #0x4]
    add r0, r0, #0xf9
    and r0, r0, #0xff
    add r1, r1, r2, lsl #0x8
    cmp r0, #0x1
    add r5, r1, #0x5
    ldrb r4, [r7]
    bhi .L_cec
    cmp r4, #0x15
    bne .L_cfc
.L_cec:
    cmp r4, #0x15
    bne .L_d0c
    cmp r5, #0x7
    bls .L_d0c
.L_cfc:
    mov r0, r8
    mov r1, r7
    bl func_02076008
    mov r5, r0
.L_d0c:
    sub r0, r4, #0x14
    cmp r0, #0x3
    add r6, r7, #0x5
    sub r5, r5, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_ec8
    b .L_d34
    b .L_d64
    b .L_d78
    b .L_ea4
.L_d34:
    ldr r0, [r8, #0x1d4]
    cmp r0, #0x0
    moveq r0, #0x9
    streqb r0, [r8, #0x455]
    beq .L_ed0
    add r0, r8, #0x2e4
    mov r1, #0x0
    mov r2, #0x8
    bl func_020945f4
    mov r0, #0x7
    strb r0, [r8, #0x455]
    b .L_ed0
.L_d64:
    ldrb r0, [r6]
    cmp r0, #0x2
    moveq r0, #0x9
    streqb r0, [r8, #0x455]
    b .L_ed0
.L_d78:
    ldrb r1, [r6, #0x1]
    ldrb r0, [r6, #0x2]
    ldrb r3, [r6]
    ldrb r2, [r6, #0x3]
    mov r1, r1, lsl #0x10
    add r0, r1, r0, lsl #0x8
    cmp r3, #0xb
    add r4, r2, r0
    add r6, r6, #0x4
    bgt .L_dcc
    cmp r3, #0xb
    bge .L_e40
    cmp r3, #0x2
    bgt .L_e6c
    cmp r3, #0x1
    blt .L_e6c
    cmp r3, #0x1
    beq .L_df8
    cmp r3, #0x2
    beq .L_e30
    b .L_e6c
.L_dcc:
    cmp r3, #0x14
    bgt .L_e6c
    cmp r3, #0xe
    blt .L_e6c
    cmp r3, #0xe
    beq .L_e50
    cmp r3, #0x10
    beq .L_e20
    cmp r3, #0x14
    beq .L_e5c
    b .L_e6c
.L_df8:
    ldrb r0, [r8, #0x454]
    cmp r0, #0x0
    beq .L_e74
    ldrb r0, [r8, #0x455]
    cmp r0, #0x0
    bne .L_e74
    mov r0, r8
    mov r1, r6
    bl func_02076ad0
    b .L_e74
.L_e20:
    mov r0, r8
    mov r1, r6
    bl func_0207651c
    b .L_e74
.L_e30:
    mov r0, r8
    mov r1, r6
    bl func_02076d14
    b .L_e74
.L_e40:
    mov r0, r8
    mov r1, r6
    bl func_02076ddc
    b .L_e74
.L_e50:
    mov r0, #0x4
    strb r0, [r8, #0x455]
    b .L_e74
.L_e5c:
    mov r0, r8
    mov r1, r6
    bl func_02076284
    b .L_e74
.L_e6c:
    mov r0, #0x9
    strb r0, [r8, #0x455]
.L_e74:
    mov r0, r8
    sub r1, r6, #0x4
    add r2, r4, #0x4
    bl func_02075d44
    add r0, r4, #0x4
    add r6, r6, r4
    subs r5, r5, r0
    beq .L_ed0
    ldrb r0, [r8, #0x455]
    cmp r0, #0x9
    bne .L_d78
    b .L_ed0
.L_ea4:
    str r7, [r8, #0x824]
    mov r0, #0x5
    str r0, [r8, #0x82c]
    add r0, r5, #0x5
    str r0, [r8, #0x828]
    mov r0, #0x1
    strb r0, [r8, #0x456]
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_ec8:
    mov r0, #0x9
    strb r0, [r8, #0x455]
.L_ed0:
    ldr r1, _LIT0
    mov r0, r7
    ldr r1, [r1]
    blx r1
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_0219ef0c
