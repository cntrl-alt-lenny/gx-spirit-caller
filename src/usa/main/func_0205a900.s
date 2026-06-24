; func_0205a900 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021006e4
        .extern data_021006e8
        .extern data_02100764
        .extern data_02100798
        .extern data_0210079c
        .extern data_021007a0
        .extern data_021007a4
        .extern data_021007ac
        .extern data_021007f4
        .extern data_021007fc
        .extern data_02100804
        .extern data_0210080c
        .extern data_02100814
        .extern data_0210081c
        .extern data_02100824
        .extern data_0210082c
        .extern data_02100840
        .extern data_02100850
        .extern data_02100860
        .extern data_0210086c
        .extern data_02100878
        .extern data_02100888
        .extern data_02100898
        .extern data_021008a8
        .extern data_021008bc
        .extern func_0205add8
        .extern func_0205ae18
        .extern func_0205ff4c
        .extern func_020a9698
        .global func_0205a900
        .arm
func_0205a900:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    ldr r3, _LIT0
    mov r4, r0
    sub r1, r1, r3
    cmp r1, #0x18
    addls pc, pc, r1, lsl #0x2
    b .L_c2c
    b .L_940
    b .L_c2c
    b .L_86c
    b .L_c2c
    b .L_c2c
    b .L_8b4
    b .L_96c
    b .L_998
    b .L_9c4
    b .L_c2c
    b .L_9fc
    b .L_c2c
    b .L_a34
    b .L_a6c
    b .L_a98
    b .L_ac4
    b .L_c2c
    b .L_c2c
    b .L_af8
    b .L_b24
    b .L_b50
    b .L_b7c
    b .L_ba8
    b .L_bd4
    b .L_c00
.L_86c:
    cmp r2, #0x0
    bge .L_888
    ldr r1, _LIT1
    bl func_0205ff4c
    add sp, sp, #0x10
    mov r0, #0x2
    ldmia sp!, {r4, pc}
.L_888:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a9698
    ldr r1, _LIT3
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_c44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_8b4:
    cmp r2, #0x500
    beq .L_8d8
    ldr r1, _LIT4
    cmp r2, r1
    beq .L_8f4
    ldr r1, _LIT5
    cmp r2, r1
    beq .L_910
    b .L_92c
.L_8d8:
    ldr r1, _LIT6
    ldr r2, _LIT7
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_c44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_8f4:
    ldr r1, _LIT6
    ldr r2, _LIT8
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_c44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_910:
    ldr r1, _LIT6
    ldr r2, _LIT9
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_c44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_92c:
    ldr r1, _LIT10
    bl func_0205ff4c
    add sp, sp, #0x10
    mov r0, #0x2
    ldmia sp!, {r4, pc}
.L_940:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a9698
    ldr r1, _LIT11
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_c44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_96c:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a9698
    ldr r1, _LIT12
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205add8
    cmp r0, #0x0
    beq .L_c44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_998:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a9698
    ldr r1, _LIT13
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205add8
    cmp r0, #0x0
    beq .L_c44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_9c4:
    mov r0, r2, asr #0x3
    add r2, r2, r0, lsr #0x1c
    ldr r1, _LIT2
    add r0, sp, #0x0
    mov r2, r2, asr #0x4
    bl func_020a9698
    ldr r1, _LIT14
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205add8
    cmp r0, #0x0
    beq .L_c44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_9fc:
    mov r0, r2, asr #0x1
    add r2, r2, r0, lsr #0x1e
    ldr r1, _LIT2
    add r0, sp, #0x0
    mov r2, r2, asr #0x2
    bl func_020a9698
    ldr r1, _LIT15
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205add8
    cmp r0, #0x0
    beq .L_c44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_a34:
    mov r0, r2, asr #0x1
    add r2, r2, r0, lsr #0x1e
    ldr r1, _LIT2
    add r0, sp, #0x0
    mov r2, r2, asr #0x2
    bl func_020a9698
    ldr r1, _LIT16
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205add8
    cmp r0, #0x0
    beq .L_c44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_a6c:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a9698
    ldr r1, _LIT17
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205add8
    cmp r0, #0x0
    beq .L_c44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_a98:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a9698
    ldr r1, _LIT18
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205add8
    cmp r0, #0x0
    beq .L_c44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_ac4:
    ldr r1, _LIT2
    cmp r2, #0x0
    movne r2, #0x1
    add r0, sp, #0x0
    bl func_020a9698
    ldr r1, _LIT19
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205add8
    cmp r0, #0x0
    beq .L_c44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_af8:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a9698
    ldr r1, _LIT20
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_c44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_b24:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a9698
    ldr r1, _LIT21
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_c44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_b50:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a9698
    ldr r1, _LIT22
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_c44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_b7c:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a9698
    ldr r1, _LIT23
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_c44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_ba8:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a9698
    ldr r1, _LIT24
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_c44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_bd4:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a9698
    ldr r1, _LIT25
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_c44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_c00:
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_020a9698
    ldr r1, _LIT26
    add r2, sp, #0x0
    mov r0, r4
    bl func_0205ae18
    cmp r0, #0x0
    beq .L_c44
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_c2c:
    ldr r1, _LIT27
    mov r0, r4
    bl func_0205ff4c
    add sp, sp, #0x10
    mov r0, #0x2
    ldmia sp!, {r4, pc}
.L_c44:
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000706
_LIT1: .word data_0210082c
_LIT2: .word data_021006e4
_LIT3: .word data_02100764
_LIT4: .word 0x00000501
_LIT5: .word 0x00000502
_LIT6: .word data_021007a4
_LIT7: .word data_02100798
_LIT8: .word data_0210079c
_LIT9: .word data_021007a0
_LIT10: .word data_02100840
_LIT11: .word data_021007ac
_LIT12: .word data_02100850
_LIT13: .word data_02100860
_LIT14: .word data_0210086c
_LIT15: .word data_02100878
_LIT16: .word data_02100888
_LIT17: .word data_02100898
_LIT18: .word data_021008a8
_LIT19: .word data_021008bc
_LIT20: .word data_021007f4
_LIT21: .word data_021007fc
_LIT22: .word data_02100804
_LIT23: .word data_0210080c
_LIT24: .word data_02100814
_LIT25: .word data_0210081c
_LIT26: .word data_02100824
_LIT27: .word data_021006e8
