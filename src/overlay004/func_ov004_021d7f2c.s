; func_ov004_021d7f2c - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov004_0220b500
        .extern data_ov004_022915e8
        .extern func_02006110
        .extern func_0200617c
        .extern func_02006194
        .extern func_02037208
        .extern func_ov004_021d7440
        .global func_ov004_021d7f2c
        .arm
func_ov004_021d7f2c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    ldr r4, _LIT0
    ldr r0, [r4, #0x88]
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x90]
    cmp r0, #0x0
    movlt r0, #0x0
    strlt r0, [r4, #0x90]
    mov r0, #0x0
    str r0, [r4, #0x60]
    bl func_02006194
    cmp r0, #0x0
    bne .L_314
    bl func_0200617c
    cmp r0, #0x0
    beq .L_5a0
.L_314:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_02006110
    ldr r0, [sp, #0x4]
    mov r1, #0x1
    str r1, [r4, #0x60]
    cmp r0, #0x4
    blt .L_410
    cmp r0, #0xca
    bge .L_410
    ldr r1, [sp]
    cmp r1, #0x8
    blt .L_410
    cmp r1, #0x94
    bge .L_410
    ldr lr, _LIT2
    sub r5, r1, #0x8
    smull r1, r2, lr, r5
    add r2, r5, r2
    mov ip, r5, lsr #0x1f
    add r2, ip, r2, asr #0x5
    mov r3, #0x23
    smull r1, r2, r3, r2
    sub r2, r5, r1
    cmp r2, #0x20
    bge .L_410
    smull r1, r2, lr, r5
    add r2, r5, r2
    add r2, ip, r2, asr #0x5
    mov r1, #0x0
    str r1, [r4, #0x60]
    str r2, [r4, #0x90]
    cmp r0, #0x19
    blt .L_3a4
    cmp r0, #0xb5
    blt .L_410
.L_3a4:
    cmp r0, #0x21
    mvnlt r0, #0x0
    movge r0, #0x1
    str r0, [r4, #0x9c]
    bl func_0200617c
    cmp r0, #0x0
    beq .L_410
    ldr r0, [r4, #0x90]
    cmp r0, #0x3
    bne .L_3dc
    add r0, r4, #0x3000
    ldr r0, [r0, #0xcc8]
    cmp r0, #0x0
    bne .L_410
.L_3dc:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    add r0, r4, #0x94
    ldr r1, [r4, #0x90]
    add r2, r0, #0x3c00
    ldr r0, [r2, r1, lsl #0x2]
    eor r0, r0, #0x1
    str r0, [r2, r1, lsl #0x2]
    ldr r0, [r4, #0x90]
    bl func_ov004_021d7440
.L_410:
    ldr r0, [sp, #0x4]
    cmp r0, #0xd0
    blt .L_4b0
    cmp r0, #0xfd
    bge .L_4b0
    ldr r0, [sp]
    cmp r0, #0x3b
    blt .L_4b0
    cmp r0, #0xa3
    bge .L_4b0
    sub lr, r0, #0x7
    ldr ip, _LIT3
    mov r3, lr, lsr #0x1f
    smull r0, r1, ip, lr
    add r1, r3, r1, asr #0x4
    mov r2, #0x34
    smull r0, r1, r2, r1
    sub r1, lr, r0
    cmp r1, #0x2d
    bge .L_4b0
    smull r0, r1, ip, lr
    add r1, r3, r1, asr #0x4
    add r0, r4, #0x3000
    str r1, [r0, #0xc8c]
    bl func_0200617c
    cmp r0, #0x0
    beq .L_4b0
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r0, [sp]
    ldr r1, _LIT3
    sub r2, r0, #0x7
    smull r0, r3, r1, r2
    mov r0, r2, lsr #0x1f
    add r3, r0, r3, asr #0x4
    add r0, r3, #0x1
    str r0, [r4, #0x88]
.L_4b0:
    ldr r0, [sp, #0x4]
    cmp r0, #0x18
    blt .L_518
    cmp r0, #0xb6
    bge .L_518
    ldr r0, [sp]
    cmp r0, #0x96
    blt .L_518
    cmp r0, #0xae
    bge .L_518
    mov r2, #0x0
    mov r1, #0x4
    mov r0, #0x1
    str r2, [r4, #0x60]
    str r1, [r4, #0x90]
    str r0, [r4, #0x9c]
    bl func_0200617c
    cmp r0, #0x0
    beq .L_518
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x1
    str r0, [r4, #0x88]
.L_518:
    ldr r0, [sp, #0x4]
    cmp r0, #0xe0
    addlt sp, sp, #0x8
    ldmltia sp!, {r3, r4, r5, pc}
    cmp r0, #0xfa
    addge sp, sp, #0x8
    ldmgeia sp!, {r3, r4, r5, pc}
    ldr r0, [sp]
    cmp r0, #0xa4
    addlt sp, sp, #0x8
    ldmltia sp!, {r3, r4, r5, pc}
    cmp r0, #0xbe
    addge sp, sp, #0x8
    ldmgeia sp!, {r3, r4, r5, pc}
    mov r0, #0x1
    str r0, [r4, #0xa0]
    bl func_0200617c
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r0, [r4, #0x54]
    mov r2, #0x1
    sub r1, r0, #0x1
    mvn r0, #0xff
    add sp, sp, #0x8
    str r2, [r4, #0xa0]
    str r1, [r4, #0x54]
    str r0, [r4, #0x58]
    ldmia sp!, {r3, r4, r5, pc}
.L_5a0:
    ldr r1, [r4, #0x90]
    cmp r1, #0x0
    beq .L_5e0
    ldr r0, _LIT4
    ldrh r0, [r0, #0x54]
    tst r0, #0x40
    beq .L_5e0
    mov r0, #0x38
    sub ip, r1, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str ip, [r4, #0x90]
    bl func_02037208
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_5e0:
    cmp r1, #0x4
    bge .L_620
    ldr r0, _LIT4
    ldrh r0, [r0, #0x54]
    tst r0, #0x80
    beq .L_620
    ldr r1, [r4, #0x90]
    mov r0, #0x38
    add ip, r1, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str ip, [r4, #0x90]
    bl func_02037208
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_620:
    ldr r0, _LIT4
    ldrh r0, [r0, #0x54]
    tst r0, #0x30
    beq .L_6a0
    cmp r1, #0x3
    bne .L_64c
    add r0, r4, #0x3000
    ldr r0, [r0, #0xcc8]
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r3, r4, r5, pc}
.L_64c:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r0, _LIT4
    ldr r1, [r4, #0x90]
    ldrh r0, [r0, #0x54]
    tst r0, #0x20
    mvnne r2, #0x0
    moveq r2, #0x1
    add r0, r4, #0x94
    str r2, [r4, #0x9c]
    add r2, r0, #0x3c00
    ldr r0, [r2, r1, lsl #0x2]
    eor r0, r0, #0x1
    str r0, [r2, r1, lsl #0x2]
    ldr r0, [r4, #0x90]
    bl func_ov004_021d7440
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_6a0:
    cmp r1, #0x4
    bne .L_6d4
    tst r0, #0x1
    beq .L_6d4
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x1
    add sp, sp, #0x8
    str r0, [r4, #0x88]
    ldmia sp!, {r3, r4, r5, pc}
.L_6d4:
    tst r0, #0x2
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r0, [r4, #0x54]
    mov r2, #0x1
    sub r1, r0, #0x1
    mvn r0, #0xff
    str r2, [r4, #0xa0]
    str r1, [r4, #0x54]
    str r0, [r4, #0x58]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_ov004_022915e8
_LIT2: .word 0xea0ea0eb
_LIT3: .word 0x4ec4ec4f
_LIT4: .word data_02104bac
