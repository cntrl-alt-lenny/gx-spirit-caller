; func_ov002_022b867c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_ov002_022ccbdc
        .extern data_ov002_022ccc5c
        .extern data_ov002_022cd73c
        .extern data_ov002_022d1410
        .extern data_ov002_022d17f0
        .extern data_ov002_022d1910
        .global func_ov002_022b867c
        .arm
func_ov002_022b867c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    cmp r2, #0x0
    blt .L_18
    cmp r2, #0x10
    blt .L_50
.L_18:
    ldr r3, _LIT0
    ldr r1, [sp, #0x28]
    ldrsh r4, [r3, #0xc2]
    add r0, sp, #0x4
    mov r2, #0xc
    str r4, [sp, #0x4]
    ldrsh r4, [r3, #0xc4]
    str r4, [sp, #0x8]
    ldrsh r3, [r3, #0xc6]
    str r3, [sp, #0xc]
    bl Copy32
    add sp, sp, #0x10
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_50:
    mov r4, #0x6
    mul r7, r2, r4
    ldr r6, _LIT1
    ldr r5, _LIT2
    ldr r4, _LIT3
    ldrsh r6, [r6, r7]
    ldrsh r5, [r5, r7]
    ldrsh r4, [r4, r7]
    str r6, [sp, #0x4]
    str r5, [sp, #0x8]
    str r4, [sp, #0xc]
    cmp r2, #0xb
    bne .L_178
    ldr r4, _LIT4
    mov r2, #0xcc
    mla ip, r1, r2, r4
    ldr r2, _LIT5
    ldr r4, [ip, #0xa4]
    ldrh r2, [r2, #0x90]
    cmp r4, #0x8
    movge r4, #0x8
    strh r2, [sp]
    ldr r2, [ip, #0xa8]
    cmp r4, #0x0
    sub r3, r3, r2
    ble .L_d0
    sub r2, r4, #0x1
    ldr r5, [sp, #0x4]
    rsb r4, r2, r3, lsl #0x1
    mov r2, #0x1e
    mla r2, r4, r2, r5
    str r2, [sp, #0x4]
.L_d0:
    ldrh r2, [sp]
    mov r4, r2, lsl #0x1a
    mov r4, r4, lsr #0x1b
    cmp r4, #0xb
    moveq r2, r2, lsl #0x1f
    cmpeq r1, r2, lsr #0x1f
    bne .L_1d8
    add r2, sp, #0x0
    ldrh r7, [r2]
    ldr r5, [ip, #0xa8]
    ldr r4, _LIT6
    mov r6, r7, lsl #0x12
    rsb r5, r5, r6, lsr #0x18
    mov ip, r5, lsl #0x10
    mov r5, ip, lsr #0x10
    bic r6, r7, #0x3fc0
    mov r5, r5, lsl #0x18
    orr r5, r6, r5, lsr #0x12
    strh r5, [r2]
    ldrh r2, [sp]
    mov lr, #0x3
    mov r5, r2, lsl #0x12
    mov r6, r5, lsr #0x18
    smull r2, ip, r4, r6
    add ip, ip, r6, lsr #0x1f
    smull r2, ip, lr, ip
    rsb ip, r2, r5, lsr #0x18
    add r0, r0, ip, lsl #0x2
    ldr r0, [r0, #0xd00]
    cmp r0, #0x0
    beq .L_1d8
    cmp r3, r6
    bge .L_164
    ldr r0, [sp, #0x4]
    sub r0, r0, #0x8
    str r0, [sp, #0x4]
    b .L_1d8
.L_164:
    ble .L_1d8
    ldr r0, [sp, #0x4]
    add r0, r0, #0x8
    str r0, [sp, #0x4]
    b .L_1d8
.L_178:
    sub r3, r2, #0xc
    cmp r3, #0x3
    bhi .L_1d8
    ldr r0, _LIT7
    cmp r2, #0xc
    movlt r0, #0x0
    blt .L_1a8
    add r2, r0, #0x280
    mov r0, #0xb0
    mla r2, r1, r0, r2
    mov r0, #0x2c
    mla r0, r3, r0, r2
.L_1a8:
    ldrsh r3, [r0, #0x2a]
    mov r0, #0x14
    cmp r3, #0x28
    movgt r3, #0x28
    mul r2, r3, r0
    ldr r3, _LIT8
    mov r0, r2, lsr #0x1f
    smull r2, r4, r3, r2
    ldr r2, [sp, #0x8]
    add r4, r0, r4, asr #0x4
    add r0, r2, r4
    str r0, [sp, #0x8]
.L_1d8:
    ldr r0, _LIT9
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r1, r0
    bne .L_204
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0xc]
    rsb r1, r1, #0x0
    rsb r0, r0, #0x0
    str r1, [sp, #0x4]
    str r0, [sp, #0xc]
.L_204:
    ldr r1, [sp, #0x28]
    add r0, sp, #0x4
    mov r2, #0xc
    bl Copy32
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ccbdc
_LIT1: .word data_ov002_022ccc5c
_LIT2: .word data_ov002_022ccc5c+0x2
_LIT3: .word data_ov002_022ccc5c+0x4
_LIT4: .word data_ov002_022d17f0
_LIT5: .word data_ov002_022d1910
_LIT6: .word 0x55555556
_LIT7: .word data_ov002_022d1410
_LIT8: .word 0x66666667
_LIT9: .word data_ov002_022cd73c
