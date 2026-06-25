; func_0203546c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02035458
        .extern func_02036260
        .extern func_02036424
        .extern func_020371fc
        .extern func_02037d70
        .extern func_02038118
        .extern func_0203a144
        .extern func_0203bbd8
        .extern func_0203bd9c
        .extern func_0203c53c
        .extern func_0203c600
        .extern func_02087dec
        .global func_0203546c
        .arm
func_0203546c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x68]
    tst r0, #0x400
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, [r4]
    ldrb r1, [r1, #0x58]
    cmp r1, #0x1
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    tst r0, #0x18
    beq .L_ac
    mov r1, #0x0
    strb r1, [r4, #0x71]
    tst r0, #0x10
    beq .L_78
    bic r0, r0, #0x10
    tst r0, #0x4
    beq .L_68
    ldrb r1, [r4, #0x70]
    and r1, r1, #0xf
    cmp r1, #0x4
    movge r1, #0x1
    strgeb r1, [r4, #0x71]
    b .L_a8
.L_68:
    mov r1, #0x1
    strb r1, [r4, #0x70]
    orr r0, r0, #0x4
    b .L_a8
.L_78:
    bic r0, r0, #0x8
    tst r0, #0x4
    beq .L_9c
    ldrb r1, [r4, #0x70]
    and r1, r1, #0xf
    cmp r1, #0x4
    movlt r1, #0x4
    strltb r1, [r4, #0x71]
    b .L_a8
.L_9c:
    mov r1, #0x4
    strb r1, [r4, #0x70]
    orr r0, r0, #0x4
.L_a8:
    strh r0, [r4, #0x68]
.L_ac:
    tst r0, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x68]
    ldrb r2, [r4, #0x70]
    bic r0, r0, #0x1
    cmp r2, #0x3
    orreq r0, r0, #0x1
    strh r0, [r4, #0x68]
    tst r2, #0x80
    bne .L_f4
    ldrb r1, [r4, #0x71]
    cmp r1, #0x0
    beq .L_f4
    strb r1, [r4, #0x70]
    mov r0, #0x0
    strb r0, [r4, #0x71]
    and r2, r1, #0xff
.L_f4:
    ldr r1, [r4, #0x34]
    and r0, r2, #0xf
    mov r1, r1, lsr #0x14
    cmp r0, #0x6
    and r1, r1, #0xf
    addls pc, pc, r0, lsl #0x2
    b .L_404
    b .L_404
    b .L_12c
    b .L_184
    b .L_20c
    b .L_214
    b .L_314
    b .L_3bc
.L_12c:
    tst r2, #0x80
    bne .L_158
    ldrb r2, [r4, #0x70]
    mov r1, #0x0
    mov r0, r4
    orr r2, r2, #0x80
    strb r2, [r4, #0x70]
    strb r1, [r4, #0x28]
    ldrsb r1, [r4, #0x26]
    ldrb r2, [r4, #0x2e]
    bl func_02037d70
.L_158:
    ldrb r0, [r4, #0x2e]
    sub r1, r0, #0x1
    add r0, r1, #0x1
    strb r1, [r4, #0x2e]
    cmp r0, #0x0
    bgt .L_404
    mov r0, r4
    mov r1, #0x2
    mov r2, #0x6
    bl func_02035458
    b .L_404
.L_184:
    tst r2, #0x80
    ldreqb r0, [r4, #0x70]
    orreq r0, r0, #0x80
    streqb r0, [r4, #0x70]
    cmp r1, #0x4
    bne .L_1b8
    ldr r0, [r4, #0x4]
    bl func_0203c600
    str r0, [r4, #0x38]
    add r0, r4, #0x4
    mov r1, #0x0
    bl func_0203c53c
    b .L_1e4
.L_1b8:
    ldrh r0, [r4, #0x68]
    tst r0, #0x2
    cmpeq r1, #0x1
    bne .L_1e4
    add r0, r4, #0x4
    mov r1, #0x1
    bl func_02087dec
    ldr r0, [r4]
    mov r1, #0x0
    mov r2, #0x1
    bl func_0203a144
.L_1e4:
    ldrh r0, [r4, #0x68]
    orr r0, r0, #0x1
    strh r0, [r4, #0x68]
    bl func_020371fc
    bl func_02036260
    mov r0, r4
    mov r1, #0x3
    mov r2, #0x4
    bl func_02035458
    b .L_404
.L_20c:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_214:
    tst r2, #0x80
    bne .L_2e4
    cmp r1, #0x4
    beq .L_2a0
    cmp r1, #0x1
    bne .L_238
    ldrh r0, [r4, #0x68]
    tst r0, #0x2
    beq .L_24c
.L_238:
    mov r0, r4
    mov r1, #0x6
    mov r2, #0x1
    bl func_02035458
    b .L_404
.L_24c:
    ldr r0, [r4]
    ldr r1, [r0, #0x8]
    tst r1, #0x80
    beq .L_26c
    ldrb r0, [r4, #0x70]
    orr r0, r0, #0x80
    strb r0, [r4, #0x70]
    b .L_404
.L_26c:
    mov r1, #0x0
    mov r2, r1
    bl func_0203a144
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4]
    mov r1, #0x0
    str r1, [r0]
    ldr r0, [r4]
    mov r1, #0x3
    strb r1, [r0, #0x58]
    b .L_2d4
.L_2a0:
    add r0, r4, #0x4
    mov r1, #0x0
    bl func_0203c53c
    mov r0, #0x0
    str r0, [r4, #0x4]
    ldrb r1, [r4, #0x6c]
    ldr r2, [r4, #0x34]
    ldr r3, [r4, #0x38]
    add r0, r4, #0x4
    bl func_0203bbd8
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_2d4:
    ldrb r0, [r4, #0x70]
    orr r0, r0, #0x80
    strb r0, [r4, #0x70]
    b .L_404
.L_2e4:
    ldr r0, [r4]
    mov r1, #0x0
    ldrb r0, [r0, #0x58]
    cmp r0, #0x1
    moveq r1, #0x1
    tst r1, #0x1
    beq .L_404
    mov r0, r4
    mov r1, #0x5
    mov r2, #0x2
    bl func_02035458
    b .L_404
.L_314:
    tst r2, #0x80
    bne .L_388
    ldrb r0, [r4, #0x70]
    cmp r1, #0x4
    orr r0, r0, #0x80
    strb r0, [r4, #0x70]
    bne .L_364
    ldr r0, [r4, #0x4]
    bl func_0203bd9c
    cmp r0, #0x0
    bne .L_350
    ldrb r0, [r4, #0x70]
    bic r0, r0, #0x80
    strb r0, [r4, #0x70]
    b .L_404
.L_350:
    mov r0, r4
    mov r1, #0x6
    mov r2, #0x2
    bl func_02035458
    b .L_404
.L_364:
    add r0, r4, #0x4
    mov r1, #0x0
    bl func_02087dec
    mov r2, #0x4
    mov r0, r4
    mov r1, #0x1000
    strb r2, [r4, #0x2d]
    bl func_02038118
    b .L_404
.L_388:
    ldrb r0, [r4, #0x2d]
    sub r0, r0, #0x1
    strb r0, [r4, #0x2d]
    tst r0, #0xff
    bne .L_404
    mov r0, r4
    mov r1, #0x100
    bl func_02038118
    mov r0, r4
    mov r1, #0x6
    mov r2, #0x2
    bl func_02035458
    b .L_404
.L_3bc:
    ldrh r0, [r4, #0x68]
    bic r0, r0, #0x100
    strh r0, [r4, #0x68]
    ldrb r0, [r4, #0x2f]
    bl func_02036424
    mov r0, #0x7f
    strb r0, [r4, #0x28]
    ldrsb r1, [r4, #0x26]
    ldrb r2, [r4, #0x2f]
    mov r0, r4
    bl func_02037d70
    ldrh r2, [r4, #0x68]
    ldr r0, _LIT0
    mov r1, #0x0
    and r0, r2, r0
    strh r0, [r4, #0x68]
    strb r1, [r4, #0x70]
    bl func_020371fc
.L_404:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0xffffefe0
