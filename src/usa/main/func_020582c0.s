; func_020582c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100180
        .extern data_021001a0
        .extern data_021001b0
        .extern func_02045364
        .extern func_020a6c60
        .global func_020582c0
        .arm
func_020582c0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    ldr r1, [r7]
    mov r4, r0
    cmp r1, #0x0
    bne .L_2c
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x6e
    bl func_020a6c60
.L_2c:
    ldr r0, [r7, #0x8]
    cmp r0, #0x0
    bne .L_4c
    ldr r0, _LIT2
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x6f
    bl func_020a6c60
.L_4c:
    ldr r1, [r7, #0x8]
    ldr r2, [r7, #0x4]
    ldr r3, [r7]
    mov r0, r4
    blx r3
    ldr r0, [r7, #0xc]
    cmp r0, #0x2
    bne .L_88
    ldr r0, [r7, #0x8]
    ldr r0, [r0, #0x8]
    bl func_02045364
    ldr r0, [r7, #0x8]
    mov r1, #0x0
    str r1, [r0, #0x8]
    b .L_1cc
.L_88:
    cmp r0, #0x3
    bne .L_108
    ldr r5, [r7, #0x8]
    mov r6, #0x0
    ldr r0, [r5, #0x38]
    cmp r0, #0x0
    ble .L_e4
    mov r4, r6
    mov r8, r6
.L_ac:
    ldr r0, [r5, #0x3c]
    ldr r0, [r0, r6, lsl #0x2]
    bl func_02045364
    ldr r0, [r5, #0x3c]
    str r4, [r0, r6, lsl #0x2]
    ldr r0, [r5, #0x40]
    ldr r0, [r0, r6, lsl #0x2]
    bl func_02045364
    ldr r0, [r5, #0x40]
    str r8, [r0, r6, lsl #0x2]
    ldr r0, [r5, #0x38]
    add r6, r6, #0x1
    cmp r6, r0
    blt .L_ac
.L_e4:
    ldr r0, [r5, #0x3c]
    bl func_02045364
    mov r0, #0x0
    str r0, [r5, #0x3c]
    ldr r0, [r5, #0x40]
    bl func_02045364
    mov r0, #0x0
    str r0, [r5, #0x40]
    b .L_1cc
.L_108:
    cmp r0, #0x4
    bne .L_128
    ldr r4, [r7, #0x8]
    ldr r0, [r4, #0xc]
    bl func_02045364
    mov r0, #0x0
    str r0, [r4, #0xc]
    b .L_1cc
.L_128:
    cmp r0, #0x7
    bne .L_150
    ldr r4, [r7, #0x8]
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_1cc
    bl func_02045364
    mov r0, #0x0
    str r0, [r4, #0x10]
    b .L_1cc
.L_150:
    cmp r0, #0x8
    bne .L_178
    ldr r4, [r7, #0x8]
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_1cc
    bl func_02045364
    mov r0, #0x0
    str r0, [r4, #0x8]
    b .L_1cc
.L_178:
    cmp r0, #0x9
    bne .L_1cc
    ldr r4, [r7, #0x8]
    mov r5, #0x0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    ble .L_1bc
    mov r6, r5
.L_198:
    ldr r0, [r4, #0x8]
    ldr r0, [r0, r5, lsl #0x2]
    bl func_02045364
    ldr r0, [r4, #0x8]
    str r6, [r0, r5, lsl #0x2]
    ldr r0, [r4, #0x4]
    add r5, r5, #0x1
    cmp r5, r0
    blt .L_198
.L_1bc:
    ldr r0, [r4, #0x8]
    bl func_02045364
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_1cc:
    ldr r0, [r7, #0x8]
    bl func_02045364
    mov r1, #0x0
    mov r0, r7
    str r1, [r7, #0x8]
    bl func_02045364
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02100180
_LIT1: .word data_021001a0
_LIT2: .word data_021001b0
