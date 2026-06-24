; func_0207a45c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a07ac
        .extern func_0207a24c
        .extern func_0207ae40
        .extern func_0207af50
        .extern func_0207b054
        .extern func_0209f708
        .global func_0207a45c
        .arm
func_0207a45c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    cmp r0, #0xc
    addls pc, pc, r0, lsl #0x2
    b .L_248
    b .L_4c
    b .L_220
    b .L_248
    b .L_248
    b .L_248
    b .L_248
    b .L_234
    b .L_248
    b .L_248
    b .L_248
    b .L_248
    b .L_234
    b .L_234
.L_4c:
    ldrh r0, [r4, #0x8]
    cmp r0, #0x9
    bgt .L_8c
    cmp r0, #0x0
    addge pc, pc, r0, lsl #0x2
    b .L_1f4
    b .L_1f4
    b .L_1f4
    b .L_1f4
    b .L_1f4
    b .L_1f4
    b .L_1f4
    b .L_26c
    b .L_114
    b .L_9c
    b .L_9c
.L_8c:
    cmp r0, #0x1a
    ldmeqia sp!, {r4, lr}
    bxeq lr
    b .L_1f4
.L_9c:
    ldr r1, _LIT0
    ldr r2, [r1]
    add r0, r2, #0x2000
    ldr r0, [r0, #0x260]
    sub r0, r0, #0x8
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_26c
    b .L_dc
    b .L_ec
    b .L_d0
    b .L_26c
    b .L_108
.L_d0:
    add r0, r2, #0x2200
    mov r1, #0x0
    strh r1, [r0, #0x82]
.L_dc:
    mov r0, #0xc
    bl func_0207af50
    ldmia sp!, {r4, lr}
    bx lr
.L_ec:
    add r0, r2, #0x2200
    mov r2, #0x0
    strh r2, [r0, #0x82]
    ldr r0, [r1]
    mov r1, #0x6
    add r0, r0, #0x2200
    strh r1, [r0, #0x80]
.L_108:
    bl func_0207ae40
    ldmia sp!, {r4, lr}
    bx lr
.L_114:
    ldr r1, _LIT0
    ldr r3, [r1]
    add r0, r3, #0x2000
    ldr r0, [r0, #0x260]
    cmp r0, #0xc
    bne .L_140
    mov r0, #0x8
    bl func_0207af50
    bl func_0207ae40
    ldmia sp!, {r4, lr}
    bx lr
.L_140:
    ldrh r2, [r4, #0xa]
    cmp r2, #0x1
    bcc .L_1e8
    ldr r0, _LIT1
    cmp r2, r0
    bhi .L_1e8
    add r0, r3, #0x2200
    strh r2, [r0, #0x82]
    ldr r1, [r1]
    ldr r0, _LIT2
    add r1, r1, #0x1500
    mov r2, #0x620
    bl func_0209f708
    cmp r0, #0x2
    ldmeqia sp!, {r4, lr}
    bxeq lr
    cmp r0, #0x3
    beq .L_1bc
    cmp r0, #0x8
    bne .L_1bc
    mov r0, #0xc
    bl func_0207af50
    ldr r0, _LIT0
    ldr r3, _LIT3
    ldr r1, [r0]
    mov r0, #0x1
    add r1, r1, #0x2140
    mov r2, #0x0
    bl func_0207b054
    ldmia sp!, {r4, lr}
    bx lr
.L_1bc:
    mov r0, #0xb
    bl func_0207af50
    ldr r0, _LIT0
    ldr r3, _LIT4
    ldr r1, [r0]
    mov r0, #0x7
    add r1, r1, #0x2140
    mov r2, #0x0
    bl func_0207b054
    ldmia sp!, {r4, lr}
    bx lr
.L_1e8:
    bl func_0207ae40
    ldmia sp!, {r4, lr}
    bx lr
.L_1f4:
    mov r0, #0xb
    bl func_0207af50
    ldr r0, _LIT0
    ldrh r2, [r4, #0x8]
    ldr r0, [r0]
    ldr r3, _LIT5
    add r1, r0, #0x2140
    mov r0, #0x7
    bl func_0207b054
    ldmia sp!, {r4, lr}
    bx lr
.L_220:
    ldr r0, _LIT0
    ldrh r1, [r4, #0xe]
    ldr r0, [r0]
    add r0, r0, #0x2200
    strh r1, [r0, #0xf8]
.L_234:
    mov r0, #0x8
    bl func_0207af50
    bl func_0207ae40
    ldmia sp!, {r4, lr}
    bx lr
.L_248:
    mov r0, #0xb
    bl func_0207af50
    ldr r0, _LIT0
    ldr r3, _LIT6
    ldr r1, [r0]
    mov r0, #0x7
    add r1, r1, #0x2140
    mov r2, #0x0
    bl func_0207b054
.L_26c:
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a07ac
_LIT1: .word 0x000007d7
_LIT2: .word func_0207a24c
_LIT3: .word 0x000007ed
_LIT4: .word 0x000007f6
_LIT5: .word 0x00000804
_LIT6: .word 0x0000081b
