; func_0205d15c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100b64
        .extern data_02100bc8
        .extern data_02100c68
        .extern data_02100cb8
        .extern data_02100cf0
        .extern data_02100cf8
        .extern data_02100d00
        .extern data_02100d08
        .extern data_02100d10
        .extern data_02100d20
        .extern data_02100d28
        .extern data_02100d30
        .extern data_02100d54
        .extern func_020453b4
        .extern func_02057980
        .extern func_02057b00
        .extern func_02058038
        .extern func_02058070
        .extern func_0205c54c
        .extern func_0205c6e4
        .extern func_0205d4c0
        .extern func_0205d674
        .extern func_0205d6bc
        .extern func_0205ffc0
        .extern func_020601d0
        .extern func_020a6d54
        .extern func_020ab054
        .extern func_020ab0c4
        .global func_0205d15c
        .arm
func_0205d15c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x1c
    mov r6, r1
    ldr r2, [r6]
    mov r7, r0
    sub r2, r2, #0x65
    ldr r5, [r7]
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_c2c
    b .L_c40
    b .L_9a0
    b .L_9b4
    b .L_b38
.L_9a0:
    bl func_0205c54c
    cmp r0, #0x0
    beq .L_c40
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_9b4:
    ldr r1, [r6, #0x8]
    add r2, sp, #0x8
    bl func_020601d0
    cmp r0, #0x0
    addne sp, sp, #0x1c
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [sp, #0x8]
    cmp r0, #0x4
    bne .L_9f0
    ldr r1, _LIT0
    mov r0, r7
    bl func_0205ffc0
    add sp, sp, #0x1c
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_9f0:
    cmp r0, #0x3
    bne .L_c40
    ldr r1, [r6, #0xc]
    add r2, sp, #0x14
    mov r0, r7
    mov r4, #0x1
    bl func_0205d6bc
    cmp r0, #0x0
    bne .L_a2c
    ldr r1, _LIT0
    mov r0, r7
    bl func_0205ffc0
    add sp, sp, #0x1c
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_a2c:
    ldr r2, _LIT1
    mov r0, r7
    add r1, r6, #0x28
    bl func_02058070
    ldr r2, _LIT2
    mov r0, r7
    add r1, r6, #0x28
    bl func_02058070
    ldr r2, [r5, #0x1a0]
    mov r0, r7
    add r1, r6, #0x28
    bl func_02058038
    ldr r2, _LIT3
    mov r0, r7
    add r1, r6, #0x28
    bl func_02058070
    mov r0, r7
    add r1, r6, #0x28
    add r2, r5, #0x110
    bl func_02058070
    mov r0, r7
    add r1, r6, #0x28
    ldr r2, _LIT4
    bl func_02058070
    mov r0, r7
    add r1, r6, #0x28
    ldr r2, [sp, #0x14]
    ldr r2, [r2, #0x18]
    bl func_02058070
    mov r0, r7
    add r1, r6, #0x28
    ldr r2, _LIT5
    bl func_02058070
    ldr r3, [r5, #0x434]
    cmp r3, #0x0
    beq .L_af0
    ldr r2, [r6, #0xc]
    mov r0, #0x0
.L_ac4:
    ldr r1, [r3, #0xc]
    cmp r1, r2
    bne .L_ae4
    cmp r3, r6
    beq .L_ae4
    ldr r1, [r3]
    cmp r1, #0x67
    movle r4, r0
.L_ae4:
    ldr r3, [r3, #0x3c]
    cmp r3, #0x0
    bne .L_ac4
.L_af0:
    cmp r4, #0x0
    beq .L_b2c
    ldr r0, [sp, #0x14]
    ldr r0, [r0, #0x18]
    bl func_020453b4
    ldr r0, [sp, #0x14]
    mov r1, #0x0
    str r1, [r0, #0x18]
    ldr r0, [sp, #0x14]
    bl func_0205d4c0
    cmp r0, #0x0
    beq .L_b2c
    ldr r1, [sp, #0x14]
    mov r0, r7
    bl func_0205d674
.L_b2c:
    mov r0, #0x68
    str r0, [r6]
    b .L_c40
.L_b38:
    add r2, sp, #0x10
    str r2, [sp]
    ldr r1, _LIT6
    add r3, sp, #0xc
    str r1, [sp, #0x4]
    ldr r1, [r6, #0x8]
    add r2, r6, #0x18
    bl func_02057b00
    cmp r0, #0x0
    addne sp, sp, #0x1c
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r6, #0x18]
    ldr r1, _LIT5
    bl func_020ab0c4
    cmp r0, #0x0
    beq .L_c40
    mov r1, #0x0
    strb r1, [r0]
    ldr r4, [r6, #0x18]
    ldr r1, _LIT7
    mov r0, r4
    mov r2, #0x7
    bl func_020ab054
    cmp r0, #0x0
    bne .L_be8
    ldr r0, [r6, #0x14]
    add r0, r0, #0x1
    str r0, [r6, #0x14]
    ldr r0, [r6, #0x14]
    cmp r0, #0x1
    ble .L_bcc
    ldr r1, _LIT8
    mov r0, r7
    bl func_0205ffc0
    add sp, sp, #0x1c
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_bcc:
    mov r0, r7
    mov r1, r6
    bl func_0205c6e4
    cmp r0, #0x0
    beq .L_c18
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_be8:
    ldr r1, _LIT9
    mov r0, r4
    mov r2, #0x6
    bl func_020ab054
    cmp r0, #0x0
    beq .L_c18
    ldr r1, _LIT10
    mov r0, r7
    bl func_0205ffc0
    add sp, sp, #0x1c
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_c18:
    mov r0, #0x69
    str r0, [r6]
    mov r0, #0x0
    str r0, [r6, #0x20]
    b .L_c40
.L_c2c:
    ldr r0, _LIT11
    ldr r1, _LIT12
    mov r2, #0x0
    mov r3, #0x9f
    bl func_020a6d54
.L_c40:
    ldr r0, [r6, #0x30]
    cmp r0, #0x0
    ble .L_c8c
    mov r1, #0x1
    ldr r0, _LIT6
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r6, #0x8]
    add r3, sp, #0x10
    mov r0, r7
    add r2, r6, #0x28
    bl func_02057980
    ldr r1, [sp, #0x10]
    cmp r1, #0x0
    bne .L_c84
    cmp r0, #0x0
    beq .L_c8c
.L_c84:
    mov r0, #0x6a
    str r0, [r6]
.L_c8c:
    mov r0, #0x0
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02100bc8
_LIT1: .word data_02100cf8
_LIT2: .word data_02100d00
_LIT3: .word data_02100d08
_LIT4: .word data_02100d10
_LIT5: .word data_02100cf0
_LIT6: .word data_02100cb8
_LIT7: .word data_02100d20
_LIT8: .word data_02100d30
_LIT9: .word data_02100d28
_LIT10: .word data_02100d54
_LIT11: .word data_02100c68
_LIT12: .word data_02100b64
