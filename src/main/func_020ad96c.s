; func_020ad96c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102aa4
        .extern data_02102ab0
        .extern data_02102abc
        .extern data_02102ac8
        .extern data_02102ad0
        .extern data_02102ad8
        .extern data_02102ae4
        .extern data_02102af0
        .extern data_02102af8
        .extern func_020ad438
        .extern func_020aee58
        .extern func_020b005c
        .extern func_020b10e0
        .extern func_020b2b50
        .global func_020ad96c
        .arm
func_020ad96c:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x44
    ldr r7, [sp, #0x80]
    ldr r0, _LIT0
    mov r8, r2
    cmp r7, r0
    ldrh r6, [sp, #0x7a]
    ldrb r5, [sp, #0x77]
    ldrb r4, [sp, #0x75]
    ldr r1, [sp, #0x68]
    ldr r2, [sp, #0x6c]
    addgt sp, sp, #0x44
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    addgt sp, sp, #0x10
    bxgt lr
    mov sl, #0x0
    mov r9, #0x20
    add r0, sp, #0x8
    add r3, sp, #0xc
    strb sl, [sp, #0x8]
    strh r9, [sp, #0xa]
    bl func_020b10e0
    ldr r0, [sp, #0x68]
    ldr r1, [sp, #0x6c]
    bl func_020b005c
    mov r2, r0
    mov r0, sl
    mov r3, r1
    mov r1, r0
    bl func_020b2b50
    bne .L_b7c
    sub r4, r8, #0xc
    ldr r1, _LIT1
    mov r0, r4
    bl func_020aee58
    add sp, sp, #0x44
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    add sp, sp, #0x10
    bx lr
.L_b7c:
    ldrb r0, [sp, #0x11]
    cmp r0, #0x49
    bne .L_bfc
    ldrsb r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_bc0
    cmp r6, #0x41
    sub r4, r8, #0xa
    bne .L_bb0
    ldr r1, _LIT2
    mov r0, r4
    bl func_020aee58
    b .L_be8
.L_bb0:
    ldr r1, _LIT3
    mov r0, r4
    bl func_020aee58
    b .L_be8
.L_bc0:
    cmp r6, #0x41
    sub r4, r8, #0x8
    bne .L_bdc
    ldr r1, _LIT4
    mov r0, r4
    bl func_020aee58
    b .L_be8
.L_bdc:
    ldr r1, _LIT5
    mov r0, r4
    bl func_020aee58
.L_be8:
    add sp, sp, #0x44
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    add sp, sp, #0x10
    bx lr
.L_bfc:
    cmp r0, #0x4e
    bne .L_c78
    ldrsb r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_c3c
    cmp r6, #0x41
    sub r4, r8, #0xa
    bne .L_c2c
    ldr r1, _LIT6
    mov r0, r4
    bl func_020aee58
    b .L_c64
.L_c2c:
    ldr r1, _LIT7
    mov r0, r4
    bl func_020aee58
    b .L_c64
.L_c3c:
    cmp r6, #0x41
    sub r4, r8, #0x8
    bne .L_c58
    ldr r1, _LIT8
    mov r0, r4
    bl func_020aee58
    b .L_c64
.L_c58:
    ldr r1, _LIT9
    mov r0, r4
    bl func_020aee58
.L_c64:
    add sp, sp, #0x44
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    add sp, sp, #0x10
    bx lr
.L_c78:
    mov r3, sl
    mov r1, #0x1
    mov r0, #0x64
    add r9, sp, #0x68
    strb r1, [sp, #0x34]
    strb r1, [sp, #0x35]
    strb r3, [sp, #0x36]
    strb r3, [sp, #0x37]
    strb r3, [sp, #0x38]
    str r3, [sp, #0x3c]
    str r1, [sp, #0x40]
    strh r0, [sp, #0x3a]
.L_ca8:
    rsb r1, r3, #0x7
    ldrsb r2, [r9, r3]
    ldrsb r0, [r9, r1]
    strb r0, [r9, r3]
    add r3, r3, #0x1
    strb r2, [r9, r1]
    cmp r3, #0x4
    blt .L_ca8
    ldrb r0, [sp, #0x69]
    ldrb r1, [sp, #0x68]
    ldr r9, _LIT10
    mov r0, r0, lsl #0x11
    orr r1, r0, r1, lsl #0x19
    add r0, sp, #0x34
    and lr, r9, r1, lsr #0x15
    sub ip, sp, #0x8
    ldmia r0, {r0, r1, r2, r3}
    stmia ip, {r0, r1, r2, r3}
    rsb r0, r9, #0x400
    mov r1, r8
    add r0, lr, r0
    ldmia ip, {r2, r3}
    bl func_020ad438
    cmp r6, #0x61
    moveq r1, #0x70
    movne r1, #0x50
    strh r1, [r0, #-2]!
    mov r1, r7, lsl #0x2
    mov lr, r7
    cmp r7, #0x1
    add r8, r1, #0xb
    add ip, sp, #0x68
    blt .L_db8
    mov r9, #0x30
.L_d30:
    cmp r8, #0x40
    bge .L_da0
    ldrb r1, [ip, r8, asr #0x3]
    and r2, r8, #0x7
    rsb r3, r2, #0x7
    mov r2, r1, asr r3
    sub sl, r8, #0x4
    bic r1, r8, #0x7
    bic sl, sl, #0x7
    cmp r1, sl
    add sl, ip, r8, asr #0x3
    and r1, r2, #0xff
    beq .L_d74
    ldrb r2, [sl, #-1]
    mov r2, r2, lsl #0x8
    orr r1, r1, r2, asr r3
    and r1, r1, #0xff
.L_d74:
    and r1, r1, #0xf
    cmp r1, #0xa
    addcc r1, r1, #0x30
    andcc r1, r1, #0xff
    bcc .L_da4
    cmp r6, #0x61
    addeq r1, r1, #0x57
    andeq r1, r1, #0xff
    addne r1, r1, #0x37
    andne r1, r1, #0xff
    b .L_da4
.L_da0:
    mov r1, r9
.L_da4:
    sub lr, lr, #0x1
    cmp lr, #0x1
    strh r1, [r0, #-2]!
    sub r8, r8, #0x4
    bge .L_d30
.L_db8:
    cmp r7, #0x0
    cmpeq r5, #0x0
    movne r1, #0x2e
    strneh r1, [r0, #-2]!
    mov r1, #0x31
    strh r1, [r0, #-2]
    cmp r6, #0x61
    moveq r1, #0x78
    movne r1, #0x58
    strh r1, [r0, #-4]!
    mov r1, #0x30
    strh r1, [r0, #-2]!
    ldrsb r1, [sp, #0xc]
    cmp r1, #0x0
    movne r1, #0x2d
    strneh r1, [r0, #-2]!
    addne sp, sp, #0x44
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    addne sp, sp, #0x10
    bxne lr
    cmp r4, #0x1
    moveq r1, #0x2b
    streqh r1, [r0, #-2]!
    addeq sp, sp, #0x44
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    addeq sp, sp, #0x10
    bxeq lr
    cmp r4, #0x2
    moveq r1, #0x20
    streqh r1, [r0, #-2]!
    add sp, sp, #0x44
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word 0x000001fd
_LIT1: .word data_02102aa4
_LIT2: .word data_02102ab0
_LIT3: .word data_02102abc
_LIT4: .word data_02102ac8
_LIT5: .word data_02102ad0
_LIT6: .word data_02102ad8
_LIT7: .word data_02102ae4
_LIT8: .word data_02102af0
_LIT9: .word data_02102af8
_LIT10: .word 0x000007ff
