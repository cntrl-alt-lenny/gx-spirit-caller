; func_0209c270 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a83e0
        .extern func_02094500
        .global func_0209c270
        .arm
func_0209c270:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r5, r0
    ldr r4, [r1]
    mov r1, #0x0
    add r0, r4, #0x18
    mov r2, #0x48
    bl func_02094500
    cmp r5, #0x0
    str r5, [r4, #0x4]
    mov r0, #0x3f
    addeq sp, sp, #0x4
    str r0, [r4, #0x4c]
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    mov r0, r5, asr #0x8
    and r0, r0, #0xff
    mov r2, #0x1
    mov r3, r2, lsl r0
    and r1, r5, #0xff
    str r3, [r4, #0x18]
    mov r0, #0xff
    strb r0, [r4, #0x48]
    cmp r1, #0x1
    bne .L_120
    cmp r3, #0x200
    beq .L_84
    cmp r3, #0x2000
    beq .L_a4
    cmp r3, #0x10000
    beq .L_c8
    b .L_2d8
.L_84:
    mov r0, #0x10
    str r0, [r4, #0x20]
    str r2, [r4, #0x24]
    mov r0, #0x5
    str r0, [r4, #0x28]
    mov r0, #0xf0
    strb r0, [r4, #0x48]
    b .L_e8
.L_a4:
    mov r0, #0x20
    str r0, [r4, #0x20]
    mov r0, #0x2
    str r0, [r4, #0x24]
    mov r0, #0x5
    str r0, [r4, #0x28]
    mov r0, #0x0
    strb r0, [r4, #0x48]
    b .L_e8
.L_c8:
    mov r0, #0x80
    str r0, [r4, #0x20]
    mov r0, #0x2
    str r0, [r4, #0x24]
    mov r0, #0xa
    str r0, [r4, #0x28]
    mov r0, #0x0
    strb r0, [r4, #0x48]
.L_e8:
    ldr r0, [r4, #0x20]
    add sp, sp, #0x4
    str r0, [r4, #0x1c]
    ldr r0, [r4, #0x4c]
    orr r0, r0, #0x40
    str r0, [r4, #0x4c]
    ldr r0, [r4, #0x4c]
    orr r0, r0, #0x100
    str r0, [r4, #0x4c]
    ldr r0, [r4, #0x4c]
    orr r0, r0, #0x200
    str r0, [r4, #0x4c]
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_120:
    cmp r1, #0x2
    bne .L_278
    cmp r3, #0x100000
    bhi .L_158
    cmp r3, #0x100000
    bcs .L_178
    cmp r3, #0x40000
    bhi .L_14c
    cmp r3, #0x40000
    beq .L_178
    b .L_2d8
.L_14c:
    cmp r3, #0x80000
    beq .L_178
    b .L_2d8
.L_158:
    cmp r3, #0x200000
    bhi .L_16c
    cmp r3, #0x200000
    beq .L_1b0
    b .L_2d8
.L_16c:
    cmp r3, #0x800000
    beq .L_1e8
    b .L_2d8
.L_178:
    mov r0, #0x19
    str r0, [r4, #0x2c]
    mov r1, #0x12c
    str r1, [r4, #0x30]
    ldr r0, _LIT1
    str r1, [r4, #0x44]
    str r0, [r4, #0x3c]
    ldr r0, [r4, #0x4c]
    orr r0, r0, #0x80
    str r0, [r4, #0x4c]
    ldr r0, [r4, #0x4c]
    orr r0, r0, #0x400
    str r0, [r4, #0x4c]
    b .L_21c
.L_1b0:
    mov r1, #0x3e8
    ldr r0, _LIT2
    str r1, [r4, #0x3c]
    ldr r1, _LIT3
    str r0, [r4, #0x40]
    ldr r0, _LIT4
    str r1, [r4, #0x34]
    str r0, [r4, #0x38]
    mov r0, #0x0
    strb r0, [r4, #0x48]
    ldr r0, [r4, #0x4c]
    orr r0, r0, #0x1000
    str r0, [r4, #0x4c]
    b .L_21c
.L_1e8:
    mov r1, #0x3e8
    ldr r0, _LIT2
    str r1, [r4, #0x3c]
    ldr r1, _LIT5
    str r0, [r4, #0x40]
    ldr r0, _LIT6
    str r1, [r4, #0x34]
    str r0, [r4, #0x38]
    mov r0, #0x0
    strb r0, [r4, #0x48]
    ldr r0, [r4, #0x4c]
    orr r0, r0, #0x1000
    str r0, [r4, #0x4c]
.L_21c:
    mov r0, #0x10000
    str r0, [r4, #0x1c]
    mov r0, #0x100
    str r0, [r4, #0x20]
    mov r0, #0x3
    str r0, [r4, #0x24]
    mov r0, #0x5
    str r0, [r4, #0x28]
    ldr r0, [r4, #0x4c]
    add sp, sp, #0x4
    orr r0, r0, #0x40
    str r0, [r4, #0x4c]
    ldr r0, [r4, #0x4c]
    orr r0, r0, #0x100
    str r0, [r4, #0x4c]
    ldr r0, [r4, #0x4c]
    orr r0, r0, #0x200
    str r0, [r4, #0x4c]
    ldr r0, [r4, #0x4c]
    orr r0, r0, #0x800
    str r0, [r4, #0x4c]
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_278:
    cmp r1, #0x3
    bne .L_2d8
    cmp r3, #0x2000
    beq .L_290
    cmp r3, #0x8000
    bne .L_2d8
.L_290:
    str r3, [r4, #0x20]
    str r3, [r4, #0x1c]
    mov r0, #0x2
    str r0, [r4, #0x24]
    mov r0, #0x0
    strb r0, [r4, #0x48]
    ldr r0, [r4, #0x4c]
    add sp, sp, #0x4
    orr r0, r0, #0x40
    str r0, [r4, #0x4c]
    ldr r0, [r4, #0x4c]
    orr r0, r0, #0x100
    str r0, [r4, #0x4c]
    ldr r0, [r4, #0x4c]
    orr r0, r0, #0x200
    str r0, [r4, #0x4c]
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_2d8:
    mov r1, #0x0
    str r1, [r4, #0x4]
    str r1, [r4, #0x18]
    ldr r0, _LIT0
    mov r1, #0x3
    ldr r0, [r0]
    str r1, [r0]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a83e0
_LIT1: .word 0x00001388
_LIT2: .word 0x00000bb8
_LIT3: .word 0x00004268
_LIT4: .word 0x00009c40
_LIT5: .word 0x000109a0
_LIT6: .word 0x00027100
