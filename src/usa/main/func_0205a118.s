; func_0205a118 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c35e0
        .extern data_021006e8
        .extern data_02100704
        .extern data_02100714
        .extern data_0210071c
        .extern data_0210072c
        .extern data_02100734
        .extern data_02100740
        .extern data_0210074c
        .extern data_02100758
        .extern data_02100764
        .extern data_02100770
        .extern data_02100788
        .extern data_02100798
        .extern data_0210079c
        .extern data_021007a0
        .extern data_021007a4
        .extern data_021007ac
        .extern data_021007b8
        .extern data_021007cc
        .extern data_021007e0
        .extern data_021007ec
        .extern data_021007f4
        .extern data_021007fc
        .extern data_02100804
        .extern data_0210080c
        .extern data_02100814
        .extern data_0210081c
        .extern data_02100824
        .extern func_02055224
        .extern func_0205a900
        .extern func_0205add8
        .extern func_0205ae18
        .extern func_0205ff4c
        .extern func_0206043c
        .extern func_020aace8
        .extern func_020acd0c
        .global func_0205a118
        .arm
func_0205a118:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x100
    mov r6, r0
    movs r5, r2
    ldr r4, [r6]
    bne .L_2c
    ldr r1, _LIT0
    bl func_0205ff4c
    add sp, sp, #0x100
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_2c:
    sub r1, r1, #0x700
    cmp r1, #0x1e
    addls pc, pc, r1, lsl #0x2
    b .L_734
    b .L_b8
    b .L_118
    b .L_17c
    b .L_1e4
    b .L_248
    b .L_278
    b .L_404
    b .L_2a8
    b .L_2d8
    b .L_308
    b .L_734
    b .L_360
    b .L_734
    b .L_434
    b .L_45c
    b .L_484
    b .L_4b4
    b .L_4dc
    b .L_50c
    b .L_734
    b .L_534
    b .L_55c
    b .L_584
    b .L_5b4
    b .L_5e4
    b .L_614
    b .L_644
    b .L_674
    b .L_6a4
    b .L_6d4
    b .L_704
.L_b8:
    ldrsb r1, [r5]
    cmp r1, #0x0
    bne .L_d8
    ldr r1, _LIT0
    bl func_0205ff4c
    add sp, sp, #0x100
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_d8:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x1f
    bl func_0206043c
    add r1, sp, #0x0
    add r0, r4, #0x110
    mov r2, #0x1f
    bl func_0206043c
    ldr r1, _LIT1
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_118:
    ldrsb r1, [r5]
    cmp r1, #0x0
    bne .L_138
    ldr r1, _LIT0
    bl func_0205ff4c
    add sp, sp, #0x100
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_138:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x15
    bl func_0206043c
    ldr r0, _LIT2
    add r1, sp, #0x0
    add r0, r4, r0
    mov r2, #0x15
    bl func_0206043c
    ldr r1, _LIT3
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_17c:
    ldrsb r1, [r5]
    cmp r1, #0x0
    bne .L_19c
    ldr r1, _LIT0
    bl func_0205ff4c
    add sp, sp, #0x100
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_19c:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x33
    bl func_0206043c
    add r0, sp, #0x0
    bl func_02055224
    add r1, sp, #0x0
    add r0, r4, #0x144
    mov r2, #0x33
    bl func_0206043c
    ldr r1, _LIT4
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205add8
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_1e4:
    ldrsb r1, [r5]
    cmp r1, #0x0
    bne .L_204
    ldr r1, _LIT0
    bl func_0205ff4c
    add sp, sp, #0x100
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_204:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x1f
    bl func_0206043c
    ldr r0, _LIT5
    add r1, sp, #0x0
    add r0, r4, r0
    mov r2, #0x1f
    bl func_0206043c
    ldr r1, _LIT6
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205add8
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_248:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x1f
    bl func_0206043c
    ldr r1, _LIT7
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_278:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x1f
    bl func_0206043c
    ldr r1, _LIT8
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_2a8:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x4c
    bl func_0206043c
    ldr r1, _LIT9
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_2d8:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0xb
    bl func_0206043c
    ldr r1, _LIT10
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_308:
    mov r0, r5
    bl func_020aace8
    cmp r0, #0x2
    beq .L_330
    ldr r1, _LIT11
    mov r0, r6
    bl func_0205ff4c
    add sp, sp, #0x100
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_330:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x3
    bl func_0206043c
    ldr r1, _LIT12
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_360:
    ldrsb r1, [r5]
    cmp r1, #0x0
    blt .L_37c
    cmp r1, #0x80
    bge .L_37c
    ldr r0, _LIT13
    ldrb r1, [r0, r1]
.L_37c:
    mov r0, r1, lsl #0x18
    mov r0, r0, asr #0x18
    cmp r0, #0x4d
    bne .L_3a8
    ldr r0, _LIT14
    add r2, sp, #0x0
    ldrb r1, [r0]
    ldrb r0, [r0, #0x1]
    strb r1, [r2]
    strb r0, [r2, #0x1]
    b .L_3e4
.L_3a8:
    cmp r0, #0x46
    bne .L_3cc
    ldr r0, _LIT15
    add r2, sp, #0x0
    ldrb r1, [r0]
    ldrb r0, [r0, #0x1]
    strb r1, [r2]
    strb r0, [r2, #0x1]
    b .L_3e4
.L_3cc:
    ldr r0, _LIT16
    add r2, sp, #0x0
    ldrb r1, [r0]
    ldrb r0, [r0, #0x1]
    strb r1, [r2]
    strb r0, [r2, #0x1]
.L_3e4:
    ldr r1, _LIT17
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_404:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_0206043c
    ldr r1, _LIT18
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_434:
    mov r0, r5
    bl func_020acd0c
    mov r2, r0
    ldr r1, _LIT19
    mov r0, r6
    bl func_0205a900
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_45c:
    mov r0, r5
    bl func_020acd0c
    mov r2, r0
    ldr r1, _LIT20
    mov r0, r6
    bl func_0205a900
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_484:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_0206043c
    ldr r1, _LIT21
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_4b4:
    mov r0, r5
    bl func_020acd0c
    mov r2, r0
    mov r0, r6
    mov r1, #0x710
    bl func_0205a900
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_4dc:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_0206043c
    ldr r1, _LIT22
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_50c:
    mov r0, r5
    bl func_020acd0c
    mov r2, r0
    ldr r1, _LIT23
    mov r0, r6
    bl func_0205a900
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_534:
    mov r0, r5
    bl func_020acd0c
    mov r2, r0
    ldr r1, _LIT24
    mov r0, r6
    bl func_0205a900
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_55c:
    mov r0, r5
    bl func_020acd0c
    mov r2, r0
    ldr r1, _LIT25
    mov r0, r6
    bl func_0205a900
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_584:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_0206043c
    ldr r1, _LIT26
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_5b4:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x33
    bl func_0206043c
    ldr r1, _LIT27
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_5e4:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_0206043c
    ldr r1, _LIT28
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_614:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_0206043c
    ldr r1, _LIT29
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_644:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_0206043c
    ldr r1, _LIT30
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_674:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_0206043c
    ldr r1, _LIT31
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_6a4:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_0206043c
    ldr r1, _LIT32
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_6d4:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_0206043c
    ldr r1, _LIT33
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_704:
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x100
    bl func_0206043c
    ldr r1, _LIT34
    add r2, sp, #0x0
    mov r0, r6
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_74c
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_734:
    ldr r1, _LIT35
    mov r0, r6
    bl func_0205ff4c
    add sp, sp, #0x100
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_74c:
    mov r0, #0x0
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02100704
_LIT1: .word data_02100714
_LIT2: .word 0x0000012f
_LIT3: .word data_0210071c
_LIT4: .word data_0210072c
_LIT5: .word 0x00000177
_LIT6: .word data_02100734
_LIT7: .word data_02100740
_LIT8: .word data_0210074c
_LIT9: .word data_02100758
_LIT10: .word data_02100764
_LIT11: .word data_02100770
_LIT12: .word data_02100788
_LIT13: .word data_020c35e0
_LIT14: .word data_02100798
_LIT15: .word data_0210079c
_LIT16: .word data_021007a0
_LIT17: .word data_021007a4
_LIT18: .word data_021007ac
_LIT19: .word 0x0000070d
_LIT20: .word 0x0000070e
_LIT21: .word data_021007b8
_LIT22: .word data_021007cc
_LIT23: .word 0x00000712
_LIT24: .word 0x00000714
_LIT25: .word 0x00000715
_LIT26: .word data_021007e0
_LIT27: .word data_021007ec
_LIT28: .word data_021007f4
_LIT29: .word data_021007fc
_LIT30: .word data_02100804
_LIT31: .word data_0210080c
_LIT32: .word data_02100814
_LIT33: .word data_0210081c
_LIT34: .word data_02100824
_LIT35: .word data_021006e8
