; func_ov002_021f26c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern func_ov002_021b8fc8
        .extern func_ov002_021b9dec
        .extern func_ov002_021ba024
        .extern func_ov002_021bd5e8
        .extern func_ov002_021c1e10
        .extern func_ov002_021c8390
        .extern func_ov002_021c8400
        .extern func_ov002_021c8860
        .global func_ov002_021f26c4
        .arm
func_ov002_021f26c4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r1
    ldr r4, _LIT0
    and r5, r8, #0x1
    mov r7, r2
    mov r3, #0x14
    mul r6, r5, r4
    mov r9, r0
    mul r5, r7, r3
    ldr ip, _LIT1
    ldrh r4, [r9, #0x2]
    add r3, ip, r6
    add r3, r3, r5
    ldr ip, [r3, #0x30]
    mov r3, r4, lsl #0x1f
    mov r4, ip, lsl #0x13
    cmp r8, r3, lsr #0x1f
    mov ip, r4, lsr #0x13
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    cmp r7, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r3, _LIT2
    add r4, r3, r6
    ldrh r3, [r4, r5]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    cmp ip, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    bl func_ov002_021c1e10
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r3, [r9]
    ldr r1, _LIT3
    cmp r3, r1
    bgt .L_d4
    bge .L_138
    ldr r0, _LIT4
    cmp r3, r0
    bgt .L_c4
    bge .L_260
    sub r0, r0, #0x39
    cmp r3, r0
    beq .L_224
    b .L_2d0
.L_c4:
    sub r0, r1, #0xef
    cmp r3, r0
    beq .L_104
    b .L_2d0
.L_d4:
    ldr r2, _LIT5
    cmp r3, r2
    bgt .L_f4
    bge .L_1ec
    sub r0, r2, #0x70
    cmp r3, r0
    beq .L_1c0
    b .L_2d0
.L_f4:
    ldr r0, _LIT6
    cmp r3, r0
    beq .L_29c
    b .L_2d0
.L_104:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8860
    cmp r0, #0x7
    bne .L_130
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8390
    cmp r0, #0x1f4
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_130:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_138:
    ldr r0, _LIT7
    ldrh r2, [r4, r5]
    add r0, r0, r6
    ldr r3, [r5, r0]
    mov r1, r3, lsr #0x6
    mov r0, r3, lsr #0x2
    and r1, r1, #0x1
    orr r0, r0, r3, lsr #0x1
    mvn r1, r1
    and r0, r0, #0x1
    and r1, r2, r1
    mvn r0, r0
    tst r1, r0
    beq .L_1b8
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b9dec
    ldr r1, _LIT8
    cmp r0, r1
    beq .L_198
    ldr r1, _LIT9
    cmp r0, r1
    beq .L_1b0
    b .L_1b8
.L_198:
    ldr r0, _LIT10
    bl func_ov002_021bd5e8
    cmp r0, #0x0
    beq .L_1b8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1b0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1b8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1c0:
    ldr r0, _LIT11
    add r0, r0, r6
    ldrh r0, [r5, r0]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r8
    mov r1, r7
    sub r2, r2, #0x7f
    bl func_ov002_021ba024
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1ec:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b8fc8
    cmp r0, #0x0
    beq .L_21c
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8400
    cmp r0, #0x2
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_21c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_224:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b9dec
    ldr r1, _LIT12
    cmp r0, r1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT13
    ldr r1, [r0, #0x4]
    cmp r1, r8
    ldreq r0, [r0, #0x20]
    cmpeq r0, r7
    moveq r0, #0x0
    movne r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_260:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b9dec
    ldr r1, _LIT14
    cmp r0, r1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT13
    ldr r1, [r0, #0x4]
    cmp r1, r8
    ldreq r0, [r0, #0x20]
    cmpeq r0, r7
    moveq r0, #0x0
    movne r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_29c:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8860
    cmp r0, #0x9
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8400
    cmp r0, #0x5
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2d0:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x00001669
_LIT4: .word 0x0000143b
_LIT5: .word 0x00001978
_LIT6: .word 0x00001aa6
_LIT7: .word data_ov002_022cf0cc
_LIT8: .word 0x000013cd
_LIT9: .word 0x0000164e
_LIT10: .word 0x000010f4
_LIT11: .word data_ov002_022cf0c2
_LIT12: .word 0x000013c7
_LIT13: .word data_ov002_022cd314
_LIT14: .word 0x00001439
