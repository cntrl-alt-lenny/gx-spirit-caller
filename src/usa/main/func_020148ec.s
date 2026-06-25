; func_020148ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02013990
        .extern func_02018a04
        .extern func_02018a30
        .extern func_020195b8
        .extern func_02019630
        .extern func_02019668
        .extern func_0201b774
        .extern func_0201b7a0
        .global func_020148ec
        .arm
func_020148ec:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_50
    b .L_74
    b .L_8c
    b .L_a0
    b .L_b4
    b .L_cc
    b .L_1cc
.L_50:
    bl func_02013990
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x4
    ldreq r0, _LIT0
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_74:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x5
    ldreq r0, _LIT1
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_8c:
    bl func_02019630
    cmp r0, #0x67
    ldreq r0, _LIT2
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_a0:
    ldr r1, _LIT3
    mov r0, #0x13
    str r1, [r5, #0x8]
    bl func_02018a04
    ldmia sp!, {r3, r4, r5, pc}
.L_b4:
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_cc:
    ldr r0, [r4, #0x924]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_f4
    b .L_1b4
    b .L_178
    b .L_128
    b .L_fc
.L_f4:
    mov r0, #0x5
    str r0, [r4, #0x924]
.L_fc:
    bl func_02019668
    cmp r0, #0x2d
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    bl func_02018a30
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_128:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    bne .L_16c
    ldr r0, _LIT6
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x924]
    sub r0, r0, #0x1
    str r0, [r4, #0x924]
    ldmia sp!, {r3, r4, r5, pc}
.L_16c:
    ldr r0, _LIT7
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_178:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT8
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x5
    str r0, [r4, #0x920]
    mov r0, #0x1
    str r0, [r4, #0x924]
    ldmia sp!, {r3, r4, r5, pc}
.L_1b4:
    ldr r0, _LIT9
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_1cc:
    ldr r0, _LIT10
    str r0, [r5, #0x8]
    bl func_0201b774
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000a0100
_LIT1: .word 0x000a0200
_LIT2: .word 0x000a0300
_LIT3: .word 0x000a0400
_LIT4: .word 0x000a0500
_LIT5: .word 0x000a0600
_LIT6: .word 0x000a0601
_LIT7: .word 0x000a0602
_LIT8: .word 0x000a0603
_LIT9: .word 0x000a0604
_LIT10: .word 0x000a0700
