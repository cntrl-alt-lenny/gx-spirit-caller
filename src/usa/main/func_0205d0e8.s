; func_0205d0e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100a84
        .extern data_02100ae8
        .extern data_02100b88
        .extern data_02100bd8
        .extern data_02100c10
        .extern data_02100c18
        .extern data_02100c20
        .extern data_02100c28
        .extern data_02100c30
        .extern data_02100c40
        .extern data_02100c48
        .extern data_02100c50
        .extern data_02100c74
        .extern func_02045364
        .extern func_0205790c
        .extern func_02057a8c
        .extern func_02057fc4
        .extern func_02057ffc
        .extern func_0205c4d8
        .extern func_0205c670
        .extern func_0205d44c
        .extern func_0205d600
        .extern func_0205d648
        .extern func_0205ff4c
        .extern func_0206015c
        .extern func_020a6c60
        .extern func_020aaf60
        .extern func_020aafd0
        .global func_0205d0e8
        .arm
func_0205d0e8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x1c
    mov r6, r1
    ldr r2, [r6]
    mov r7, r0
    sub r2, r2, #0x65
    ldr r5, [r7]
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_2c4
    b .L_2d8
    b .L_38
    b .L_4c
    b .L_1d0
.L_38:
    bl func_0205c4d8
    cmp r0, #0x0
    beq .L_2d8
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_4c:
    ldr r1, [r6, #0x8]
    add r2, sp, #0x8
    bl func_0206015c
    cmp r0, #0x0
    addne sp, sp, #0x1c
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [sp, #0x8]
    cmp r0, #0x4
    bne .L_88
    ldr r1, _LIT0
    mov r0, r7
    bl func_0205ff4c
    add sp, sp, #0x1c
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_88:
    cmp r0, #0x3
    bne .L_2d8
    ldr r1, [r6, #0xc]
    add r2, sp, #0x14
    mov r0, r7
    mov r4, #0x1
    bl func_0205d648
    cmp r0, #0x0
    bne .L_c4
    ldr r1, _LIT0
    mov r0, r7
    bl func_0205ff4c
    add sp, sp, #0x1c
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_c4:
    ldr r2, _LIT1
    mov r0, r7
    add r1, r6, #0x28
    bl func_02057ffc
    ldr r2, _LIT2
    mov r0, r7
    add r1, r6, #0x28
    bl func_02057ffc
    ldr r2, [r5, #0x1a0]
    mov r0, r7
    add r1, r6, #0x28
    bl func_02057fc4
    ldr r2, _LIT3
    mov r0, r7
    add r1, r6, #0x28
    bl func_02057ffc
    mov r0, r7
    add r1, r6, #0x28
    add r2, r5, #0x110
    bl func_02057ffc
    mov r0, r7
    add r1, r6, #0x28
    ldr r2, _LIT4
    bl func_02057ffc
    mov r0, r7
    add r1, r6, #0x28
    ldr r2, [sp, #0x14]
    ldr r2, [r2, #0x18]
    bl func_02057ffc
    mov r0, r7
    add r1, r6, #0x28
    ldr r2, _LIT5
    bl func_02057ffc
    ldr r3, [r5, #0x434]
    cmp r3, #0x0
    beq .L_188
    ldr r2, [r6, #0xc]
    mov r0, #0x0
.L_15c:
    ldr r1, [r3, #0xc]
    cmp r1, r2
    bne .L_17c
    cmp r3, r6
    beq .L_17c
    ldr r1, [r3]
    cmp r1, #0x67
    movle r4, r0
.L_17c:
    ldr r3, [r3, #0x3c]
    cmp r3, #0x0
    bne .L_15c
.L_188:
    cmp r4, #0x0
    beq .L_1c4
    ldr r0, [sp, #0x14]
    ldr r0, [r0, #0x18]
    bl func_02045364
    ldr r0, [sp, #0x14]
    mov r1, #0x0
    str r1, [r0, #0x18]
    ldr r0, [sp, #0x14]
    bl func_0205d44c
    cmp r0, #0x0
    beq .L_1c4
    ldr r1, [sp, #0x14]
    mov r0, r7
    bl func_0205d600
.L_1c4:
    mov r0, #0x68
    str r0, [r6]
    b .L_2d8
.L_1d0:
    add r2, sp, #0x10
    str r2, [sp]
    ldr r1, _LIT6
    add r3, sp, #0xc
    str r1, [sp, #0x4]
    ldr r1, [r6, #0x8]
    add r2, r6, #0x18
    bl func_02057a8c
    cmp r0, #0x0
    addne sp, sp, #0x1c
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r6, #0x18]
    ldr r1, _LIT5
    bl func_020aafd0
    cmp r0, #0x0
    beq .L_2d8
    mov r1, #0x0
    strb r1, [r0]
    ldr r4, [r6, #0x18]
    ldr r1, _LIT7
    mov r0, r4
    mov r2, #0x7
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_280
    ldr r0, [r6, #0x14]
    add r0, r0, #0x1
    str r0, [r6, #0x14]
    ldr r0, [r6, #0x14]
    cmp r0, #0x1
    ble .L_264
    ldr r1, _LIT8
    mov r0, r7
    bl func_0205ff4c
    add sp, sp, #0x1c
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_264:
    mov r0, r7
    mov r1, r6
    bl func_0205c670
    cmp r0, #0x0
    beq .L_2b0
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_280:
    ldr r1, _LIT9
    mov r0, r4
    mov r2, #0x6
    bl func_020aaf60
    cmp r0, #0x0
    beq .L_2b0
    ldr r1, _LIT10
    mov r0, r7
    bl func_0205ff4c
    add sp, sp, #0x1c
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_2b0:
    mov r0, #0x69
    str r0, [r6]
    mov r0, #0x0
    str r0, [r6, #0x20]
    b .L_2d8
.L_2c4:
    ldr r0, _LIT11
    ldr r1, _LIT12
    mov r2, #0x0
    mov r3, #0x9f
    bl func_020a6c60
.L_2d8:
    ldr r0, [r6, #0x30]
    cmp r0, #0x0
    ble .L_324
    mov r1, #0x1
    ldr r0, _LIT6
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r6, #0x8]
    add r3, sp, #0x10
    mov r0, r7
    add r2, r6, #0x28
    bl func_0205790c
    ldr r1, [sp, #0x10]
    cmp r1, #0x0
    bne .L_31c
    cmp r0, #0x0
    beq .L_324
.L_31c:
    mov r0, #0x6a
    str r0, [r6]
.L_324:
    mov r0, #0x0
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02100ae8
_LIT1: .word data_02100c18
_LIT2: .word data_02100c20
_LIT3: .word data_02100c28
_LIT4: .word data_02100c30
_LIT5: .word data_02100c10
_LIT6: .word data_02100bd8
_LIT7: .word data_02100c40
_LIT8: .word data_02100c50
_LIT9: .word data_02100c48
_LIT10: .word data_02100c74
_LIT11: .word data_02100b88
_LIT12: .word data_02100a84
