; func_ov002_0227d8c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0250
        .extern func_ov002_021c38c4
        .extern func_ov002_0226eb5c
        .global func_ov002_0227d8c4
        .arm
func_ov002_0227d8c4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r1
    ldr r3, _LIT0
    mov r4, r7, lsl #0x2
    ldrh r3, [r3, r4]
    mov r8, r0
    mov r6, r2
    mov r9, r3, lsl #0x13
    mov r4, r9, lsr #0x13
    bl func_ov002_021c38c4
    ldr r1, _LIT1
    mov r5, r0
    cmp r1, r9, lsr #0x13
    blt .L_8c
    cmp r4, r1
    bge .L_cc
    sub r0, r1, #0x3d
    cmp r4, r0
    bgt .L_7c
    bge .L_cc
    ldr r1, _LIT2
    cmp r4, r1
    bgt .L_d4
    sub r0, r1, #0x2
    cmp r4, r0
    blt .L_d4
    subne r0, r1, #0x1
    cmpne r4, r0
    cmpne r4, r1
    beq .L_cc
    b .L_d4
.L_7c:
    sub r0, r1, #0x4
    cmp r4, r0
    beq .L_cc
    b .L_d4
.L_8c:
    ldr r1, _LIT3
    cmp r4, r1
    bgt .L_ac
    bge .L_cc
    sub r0, r1, #0x1
    cmp r4, r0
    beq .L_cc
    b .L_d4
.L_ac:
    add r0, r1, #0x1a8
    cmp r4, r0
    bgt .L_c0
    beq .L_cc
    b .L_d4
.L_c0:
    ldr r0, _LIT4
    cmp r4, r0
    bne .L_d4
.L_cc:
    mov r0, #0x3
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_d4:
    cmp r5, #0x4
    movle r0, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    cmp r6, #0x0
    movne r6, #0x40
    moveq r6, #0x10
    mov r0, r8
    mov r1, r7
    mov r2, #0x2
    mov r3, #0x0
    bl func_ov002_0226eb5c
    tst r6, r0
    beq .L_11c
    ldr r0, _LIT5
    cmp r4, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_11c:
    cmp r5, #0x6
    movle r0, #0x1
    movgt r0, #0x2
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022d0250
_LIT1: .word 0x00001729
_LIT2: .word 0x00001388
_LIT3: .word 0x00001986
_LIT4: .word 0x00001b2f
_LIT5: .word 0x00001864
