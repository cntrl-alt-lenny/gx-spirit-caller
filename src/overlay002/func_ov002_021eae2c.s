; func_ov002_021eae2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022ce884
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021c1ef0
        .extern func_ov002_021c8470
        .extern func_ov002_021c8940
        .global func_ov002_021eae2c
        .arm
func_ov002_021eae2c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    ldr r3, _LIT0
    and ip, r5, #0x1
    mov r4, r2
    mov r6, #0x14
    mul r3, ip, r3
    mul ip, r4, r6
    ldr lr, _LIT1
    add r6, lr, r3
    add r6, r6, ip
    ldr lr, [r6, #0x30]
    mov r6, r0
    mov lr, lr, lsl #0x13
    movs lr, lr, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r4, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    ldr lr, _LIT2
    add r3, lr, r3
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r1, [r6]
    ldr r0, _LIT3
    cmp r1, r0
    beq .L_98
    ldr r0, _LIT4
    cmp r1, r0
    beq .L_110
    b .L_12c
.L_98:
    ldr r3, _LIT5
    mov r2, #0x0
    ldr ip, [r3, #0x5d4]
    cmp ip, #0x0
    bls .L_12c
    ldr r6, _LIT6
.L_b0:
    ldrb r0, [r3, #0x5dc]
    cmp r0, #0x6
    cmpne r0, #0x7
    cmpne r0, #0x8
    bne .L_f8
    ldr r0, [r6]
    mov r1, r0, lsl #0x16
    cmp r5, r1, lsr #0x1f
    moveq r0, r0, lsl #0x12
    cmpeq r4, r0, lsr #0x1c
    bne .L_f8
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c8470
    cmp r0, #0x7d0
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_f8:
    add r2, r2, #0x1
    cmp r2, ip
    add r3, r3, #0x1
    add r6, r6, #0x4
    bcc .L_b0
    b .L_12c
.L_110:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c8940
    cmp r0, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_12c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word 0x000012cd
_LIT4: .word 0x0000184b
_LIT5: .word data_ov002_022ce288
_LIT6: .word data_ov002_022ce884
