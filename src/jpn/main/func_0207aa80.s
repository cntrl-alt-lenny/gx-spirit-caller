; func_0207aa80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a07ac
        .extern func_0207a45c
        .extern func_0207aa80
        .extern func_0207af50
        .extern func_0207b054
        .extern func_0209dd80
        .extern func_0209e930
        .extern func_0209f02c
        .extern func_0209f074
        .extern func_020a0628
        .extern func_020a0760
        .global func_0207aa80
        .arm
func_0207aa80:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldrh r1, [r0, #0x2]
    mov r2, #0x14
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_2a4
    b .L_30
    b .L_264
    b .L_2a4
    b .L_2a4
    b .L_2a4
.L_30:
    ldrh r0, [r0]
    cmp r0, #0x19
    bgt .L_6c
    cmp r0, #0x19
    bge .L_14c
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_1c4
    b .L_1c4
    b .L_1c4
    b .L_1c4
    b .L_8c
    b .L_9c
    b .L_100
    b .L_128
.L_6c:
    cmp r0, #0x1d
    bgt .L_80
    cmp r0, #0x1d
    beq .L_138
    b .L_1c4
.L_80:
    cmp r0, #0x27
    beq .L_174
    b .L_1c4
.L_8c:
    ldr r0, _LIT0
    bl func_0209f02c
    mov r2, r0
    b .L_1c4
.L_9c:
    bl func_0209dd80
    cmp r0, #0x0
    beq .L_b0
    cmp r0, #0x4
    b .L_d8
.L_b0:
    mov r0, #0x1
    bl func_0207af50
    mov r0, #0x0
    ldr r3, _LIT1
    mov r1, r0
    mov r2, r0
    bl func_0207b054
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_d8:
    mov r0, #0xb
    bl func_0207af50
    mov r1, #0x0
    ldr r3, _LIT2
    mov r2, r1
    mov r0, #0x7
    bl func_0207b054
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_100:
    mov r0, #0x3
    bl func_0207af50
    mov r0, #0x0
    ldr r3, _LIT3
    mov r1, r0
    mov r2, r0
    bl func_0207b054
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_128:
    ldr r0, _LIT0
    bl func_0209f074
    mov r2, r0
    b .L_1c4
.L_138:
    ldr r0, _LIT0
    mov r1, #0x0
    bl func_020a0628
    mov r2, r0
    b .L_1c4
.L_14c:
    ldr r1, _LIT4
    ldr r0, _LIT0
    ldr r3, [r1]
    add r2, r3, #0x2000
    ldrb r1, [r2, #0x250]
    ldrb r2, [r2, #0x251]
    add r3, r3, #0x2200
    bl func_020a0760
    mov r2, r0
    b .L_1c4
.L_174:
    ldr r0, _LIT4
    ldr r2, [r0]
    add r0, r2, #0x2000
    ldr r1, [r0, #0x264]
    and r0, r1, #0xc0000
    cmp r0, #0xc0000
    moveq r0, #0x1
    movne r0, #0x0
    mov r0, r0, lsl #0x10
    mov ip, r0, lsr #0x10
    and r1, r1, #0x30000
    cmp r1, #0x30000
    movne r3, #0x1
    add r1, r2, #0x2140
    ldr r0, _LIT5
    moveq r3, #0x0
    mov r2, #0x0
    str ip, [sp]
    bl func_0209e930
    mov r2, r0
.L_1c4:
    cmp r2, #0x2
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
    cmp r2, #0x3
    beq .L_224
    cmp r2, #0x8
    bne .L_224
    mov r0, #0xc
    bl func_0207af50
    ldr r0, _LIT4
    ldr r3, _LIT6
    ldr r1, [r0]
    mov r2, #0x0
    add r0, r1, #0x2200
    ldrsh r0, [r0, #0x80]
    cmp r0, #0x5
    addeq r1, r1, #0x2140
    movne r1, #0x0
    mov r0, #0x1
    bl func_0207b054
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_224:
    mov r0, #0xb
    bl func_0207af50
    ldr r0, _LIT4
    ldr r3, _LIT7
    ldr r1, [r0]
    mov r2, #0x0
    add r0, r1, #0x2200
    ldrsh r0, [r0, #0x80]
    cmp r0, #0x5
    addeq r1, r1, #0x2140
    movne r1, #0x0
    mov r0, #0x7
    bl func_0207b054
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_264:
    mov r0, #0xc
    bl func_0207af50
    ldr r0, _LIT4
    ldr r3, _LIT8
    ldr r1, [r0]
    mov r2, #0x0
    add r0, r1, #0x2200
    ldrsh r0, [r0, #0x80]
    cmp r0, #0x5
    addeq r1, r1, #0x2140
    movne r1, #0x0
    mov r0, #0x1
    bl func_0207b054
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_2a4:
    mov r0, #0xb
    bl func_0207af50
    ldr r0, _LIT4
    ldr r3, _LIT9
    ldr r1, [r0]
    mov r2, #0x0
    add r0, r1, #0x2200
    ldrsh r0, [r0, #0x80]
    cmp r0, #0x5
    addeq r1, r1, #0x2140
    movne r1, #0x0
    mov r0, #0x7
    bl func_0207b054
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word func_0207aa80
_LIT1: .word 0x00000663
_LIT2: .word 0x0000066c
_LIT3: .word 0x00000673
_LIT4: .word data_021a07ac
_LIT5: .word func_0207a45c
_LIT6: .word 0x000006af
_LIT7: .word 0x000006b8
_LIT8: .word 0x000006de
_LIT9: .word 0x000006e8
