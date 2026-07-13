; func_ov016_021b4674 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_02105a90
        .extern data_ov016_021b8c98
        .extern data_ov016_021b9024
        .extern data_ov016_021ba9e4
        .extern data_ov016_021baad8
        .extern func_0202c06c
        .extern func_020371b8
        .extern func_02052e58
        .extern func_02053008
        .extern func_ov016_021b27f4
        .extern func_ov016_021b388c
        .extern func_ov016_021b4ac0
        .extern func_ov016_021b50f0
        .extern func_ov016_021b5130
        .extern func_ov016_021b523c
        .extern func_ov016_021b52c0
        .extern func_ov016_021b53f0
        .global func_ov016_021b4674
        .arm
func_ov016_021b4674:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r1, [r4]
    cmp r1, #0x0
    beq .L_5b8
    cmp r1, #0x1
    beq .L_65c
    cmp r1, #0x2
    beq .L_99c
    b .L_9a8
.L_5b8:
    ldr r0, _LIT0
    add ip, sp, #0x0
    ldmia r0, {r0, r1, r2, r3}
    stmia ip, {r0, r1, r2, r3}
    ldr r0, _LIT1
    mov r1, ip
    bl func_ov016_021b388c
    ldr r3, _LIT2
    ldr r0, _LIT3
    ldr r2, [r3]
    ldr r1, [r3]
    and r2, r2, #0x1f00
    mov ip, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, ip, #0x14
    orr r1, r2, r1, lsl #0x8
    str r1, [r3]
    mov r1, #0x1
    str r1, [r4]
    bl func_02052e58
    cmp r1, #0x0
    cmpeq r0, #0x0
    bne .L_630
    ldr r0, _LIT4
    bl func_0202c06c
    mov r2, r0
    ldr r0, _LIT5
    mov r1, #0x11
    bl func_ov016_021b53f0
    b .L_9a8
.L_630:
    ldr r0, _LIT3
    bl func_02053008
    cmp r0, #0x0
    bne .L_9a8
    ldr r0, _LIT6
    bl func_0202c06c
    mov r2, r0
    ldr r0, _LIT5
    mov r1, #0x11
    bl func_ov016_021b53f0
    b .L_9a8
.L_65c:
    ldr r1, [r4, #0x20]
    cmp r1, #0x0
    beq .L_6d8
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    add lr, r2, #0x1000
    str r0, [r2]
    ldr r0, [lr]
    ldr r1, [lr]
    and r0, r0, #0x1f00
    mov r3, r0, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, r3, #0x10
    orr ip, r2, r1, lsl #0x8
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    str ip, [lr]
    bl func_020371b8
    mov r0, #0x2
    str r0, [r4]
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_6d8:
    ldr r1, _LIT7
    ldrh r2, [r1, #0x52]
    cmp r2, #0x0
    beq .L_940
    ldrh r1, [r1, #0x54]
    tst r1, #0x1
    beq .L_718
    bl func_ov016_021b523c
    mov r1, r0
    mov r0, r4
    bl func_ov016_021b52c0
    mov r1, r0
    mov r0, r4
    bl func_ov016_021b4ac0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_718:
    tst r1, #0x2
    beq .L_75c
    ldr r1, [r4, #0x14]
    cmp r1, #0x0
    bne .L_73c
    mov r1, #0x0
    bl func_ov016_021b4ac0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_73c:
    mov r0, #0x43
    sub ip, r1, #0x1
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    str ip, [r4, #0x14]
    bl func_020371b8
    b .L_9a8
.L_75c:
    tst r1, #0x100
    beq .L_774
    mov r1, #0x2
    bl func_ov016_021b4ac0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_774:
    tst r1, #0x200
    beq .L_78c
    mov r1, #0x1
    bl func_ov016_021b4ac0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_78c:
    tst r1, #0x40
    beq .L_7e4
    ldr r0, [r4, #0x18]
    cmp r0, #0x3
    ldr r0, [r4, #0x1c]
    bge .L_7b8
    subs r0, r0, #0x1
    str r0, [r4, #0x1c]
    movmi r0, #0x3
    strmi r0, [r4, #0x1c]
    b .L_7cc
.L_7b8:
    sub r0, r0, #0x1
    str r0, [r4, #0x1c]
    cmp r0, #0x1
    movlt r0, #0x2
    strlt r0, [r4, #0x1c]
.L_7cc:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_9a8
.L_7e4:
    tst r1, #0x80
    beq .L_838
    ldr r0, [r4, #0x18]
    cmp r0, #0x3
    ldr r0, [r4, #0x1c]
    add r0, r0, #0x1
    bge .L_810
    str r0, [r4, #0x1c]
    cmp r0, #0x3
    movgt r0, #0x0
    b .L_81c
.L_810:
    str r0, [r4, #0x1c]
    cmp r0, #0x2
    movgt r0, #0x1
.L_81c:
    strgt r0, [r4, #0x1c]
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_9a8
.L_838:
    tst r1, #0x10
    beq .L_8c0
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    bne .L_868
    ldr r0, [r4, #0x18]
    add r0, r0, #0x1
    str r0, [r4, #0x18]
    cmp r0, #0x2
    movgt r0, #0x0
    strgt r0, [r4, #0x18]
    b .L_8a8
.L_868:
    cmp r0, #0x3
    ldr r0, [r4, #0x18]
    add r0, r0, #0x1
    bne .L_898
    str r0, [r4, #0x18]
    cmp r0, #0x2
    ble .L_8a8
    mov r0, #0x3
    str r0, [r4, #0x18]
    mov r0, #0x2
    str r0, [r4, #0x1c]
    b .L_8a8
.L_898:
    str r0, [r4, #0x18]
    cmp r0, #0x3
    movgt r0, #0x0
    strgt r0, [r4, #0x18]
.L_8a8:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_9a8
.L_8c0:
    tst r1, #0x20
    beq .L_9a8
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    bne .L_8ec
    ldr r0, [r4, #0x18]
    subs r0, r0, #0x1
    str r0, [r4, #0x18]
    movmi r0, #0x2
    strmi r0, [r4, #0x18]
    b .L_928
.L_8ec:
    cmp r0, #0x3
    ldr r0, [r4, #0x18]
    bne .L_918
    subs r0, r0, #0x1
    str r0, [r4, #0x18]
    bpl .L_928
    mov r0, #0x3
    str r0, [r4, #0x18]
    mov r0, #0x2
    str r0, [r4, #0x1c]
    b .L_928
.L_918:
    subs r0, r0, #0x1
    str r0, [r4, #0x18]
    movmi r0, #0x3
    strmi r0, [r4, #0x18]
.L_928:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_9a8
.L_940:
    bl func_ov016_021b5130
    ldr r0, _LIT8
    bl func_ov016_021b27f4
    cmp r0, #0x0
    mov r0, r4
    beq .L_968
    mov r1, #0x0
    bl func_ov016_021b4ac0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_968:
    bl func_ov016_021b50f0
    cmp r0, #0x0
    beq .L_9a8
    mov r0, r4
    bl func_ov016_021b523c
    mov r1, r0
    mov r0, r4
    bl func_ov016_021b52c0
    mov r1, r0
    mov r0, r4
    bl func_ov016_021b4ac0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_99c:
    add sp, sp, #0x10
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_9a8:
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov016_021b8c98
_LIT1: .word data_ov016_021ba9e4
_LIT2: .word 0x04001000
_LIT3: .word data_02105a90
_LIT4: .word 0x00000678
_LIT5: .word data_ov016_021baad8
_LIT6: .word 0x000006bd
_LIT7: .word data_02104acc
_LIT8: .word data_ov016_021b9024
