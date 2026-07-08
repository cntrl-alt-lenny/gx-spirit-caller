; func_ov002_021c2544 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern func_0202b86c
        .extern func_0202e1e0
        .global func_ov002_021c2544
        .arm
func_ov002_021c2544:
    stmdb sp!, {r4, r5, r6, lr}
    movs r4, r2
    mov r6, r0
    mov r5, r1
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r5, #0x5
    blt .L_3c
    cmp r5, #0xa
    bge .L_3c
    mov r0, r4
    bl func_0202e1e0
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
.L_3c:
    mov r0, r4
    bl func_0202b86c
    cmp r0, #0x3
    bne .L_90
    cmp r5, #0x4
    movle r0, #0x0
    ldmleia sp!, {r4, r5, r6, pc}
    cmp r5, #0xa
    movgt r0, #0x1
    ldmgtia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    mov r1, #0x14
    ldr r2, _LIT1
    and r3, r6, #0x1
    mul r1, r5, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_90:
    ldr r1, _LIT2
    cmp r4, r1
    bgt .L_d0
    bge .L_f8
    sub r0, r1, #0x2dc
    cmp r4, r0
    bgt .L_c0
    bge .L_f8
    ldr r0, _LIT3
    cmp r4, r0
    beq .L_f8
    b .L_150
.L_c0:
    ldr r0, _LIT4
    cmp r4, r0
    beq .L_f8
    b .L_150
.L_d0:
    ldr r0, _LIT5
    cmp r4, r0
    bgt .L_ec
    bge .L_f8
    cmp r4, #0x1980
    beq .L_f8
    b .L_150
.L_ec:
    add r0, r0, #0x51
    cmp r4, r0
    bne .L_150
.L_f8:
    cmp r5, #0x5
    blt .L_150
    cmp r5, #0xa
    bge .L_150
    ldr r1, _LIT0
    and r3, r6, #0x1
    mov r0, #0x14
    mul r2, r3, r1
    ldr r1, _LIT1
    mul r3, r5, r0
    add r0, r1, r2
    ldrh r0, [r3, r0]
    cmp r0, #0x0
    beq .L_150
    ldr r0, _LIT6
    add r0, r0, r2
    ldr r1, [r3, r0]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
.L_150:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c4
_LIT2: .word 0x00001514
_LIT3: .word 0x00001231
_LIT4: .word 0x000013ea
_LIT5: .word 0x00001a18
_LIT6: .word data_ov002_022cf0cc
