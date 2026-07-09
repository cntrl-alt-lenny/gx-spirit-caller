; func_ov002_021bd868 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern func_ov002_021b2fcc
        .extern func_ov002_021b306c
        .extern func_ov002_021b3dec
        .extern func_ov002_021b9dec
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .extern func_ov002_021bb184
        .extern func_ov002_021bb8d4
        .extern func_ov002_021bd630
        .extern func_ov002_021c19f0
        .extern func_ov002_021c1c6c
        .extern func_ov002_021c8860
        .global func_ov002_021bd868
        .arm
func_ov002_021bd868:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov sl, r0
    ldr r3, _LIT0
    and r4, sl, #0x1
    mul r7, r4, r3
    mov r9, r1
    mov r2, #0x14
    mul r6, r9, r2
    ldr r3, _LIT1
    add r2, r3, r7
    add r2, r2, r6
    ldr r2, [r2, #0x30]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r2, _LIT2
    add r2, r2, r7
    ldr r2, [r6, r2]
    mov r2, r2, lsr #0x15
    tst r2, #0x1
    beq .L_78
    ldr r0, _LIT3
    ldr r0, [r0, #0x4]
    cmp sl, r0
    ldreq r0, _LIT4
    moveq r1, #0x3
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_78:
    bl func_ov002_021c19f0
    mov r4, r0
    mov r0, sl
    mov r1, r9
    bl func_ov002_021c1c6c
    mov r5, r0
    ldr r2, _LIT5
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_2d8
    ldr r2, _LIT6
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_2d8
    ldr r2, _LIT7
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_2d8
    ldr r2, _LIT8
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_2d8
    ldr r2, _LIT9
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b306c
    cmp r0, #0x0
    bne .L_2d8
    ldr r2, _LIT10
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b306c
    cmp r0, #0x0
    bne .L_2d8
    ldr r2, _LIT11
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b306c
    cmp r0, #0x0
    bne .L_2d8
    ldr r2, _LIT12
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b306c
    cmp r0, #0x0
    bne .L_2d8
    ldr r2, _LIT13
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    bne .L_2d8
    ldr r0, _LIT14
    bl func_ov002_021baf88
    mov r8, r0
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b9dec
    ldr r1, _LIT14
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    sub r0, r8, r0
    cmp r0, #0x0
    bgt .L_2d8
    ldr r0, _LIT15
    mov r1, sl
    mov r2, r5
    bl func_ov002_021bb184
    cmp r0, #0x0
    beq .L_1dc
    ldr r0, _LIT16
    add r0, r0, r7
    ldrh r0, [r6, r0]
    cmp r0, #0x0
    beq .L_1dc
    mov r0, sl
    mov r1, r9
    bl func_ov002_021c8860
    cmp r0, #0x1
    beq .L_2d8
.L_1dc:
    ldr r0, _LIT17
    mov r1, sl
    mov r2, r5
    bl func_ov002_021bb184
    cmp r0, #0x0
    beq .L_208
    ldr r0, _LIT16
    add r0, r0, r7
    ldrh r0, [r6, r0]
    cmp r0, #0x0
    bne .L_2d8
.L_208:
    mov r0, sl
    mov r1, r9
    bl func_ov002_021bd630
    cmp r0, #0x0
    beq .L_23c
    ldr r0, _LIT3
    ldr r0, [r0, #0x4]
    cmp sl, r0
    ldreq r0, _LIT4
    moveq r1, #0x10
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_23c:
    ldr r1, _LIT2
    ldr r0, _LIT16
    add r1, r1, r7
    ldr r3, [r6, r1]
    add r2, r0, r7
    mov r1, r3, lsr #0x6
    mov r0, r3, lsr #0x2
    and r1, r1, #0x1
    orr r0, r0, r3, lsr #0x1
    and r0, r0, #0x1
    ldrh r2, [r6, r2]
    mvn r1, r1
    mvn r0, r0
    and r1, r2, r1
    tst r1, r0
    beq .L_294
    ldr r2, _LIT18
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_2d8
.L_294:
    and r0, r4, #0x2
    cmp r0, #0x0
    bgt .L_2d0
    rsb r4, sl, #0x1
    ldr r1, _LIT19
    mov r0, r4
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    bne .L_2d8
    ldr r1, _LIT20
    mov r0, r4
    bl func_ov002_021bb8d4
    cmp r0, #0x0
    bne .L_2d8
.L_2d0:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_2d8:
    ldr r0, _LIT3
    ldr r0, [r0, #0x4]
    cmp sl, r0
    ldreq r0, _LIT4
    moveq r1, #0x12
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0cc
_LIT3: .word data_ov002_022cd65c
_LIT4: .word data_ov002_022d008c
_LIT5: .word 0x000012ce
_LIT6: .word 0x0000131e
_LIT7: .word 0x000017b3
_LIT8: .word 0x00001990
_LIT9: .word 0x00001103
_LIT10: .word 0x00001243
_LIT11: .word 0x000014b2
_LIT12: .word 0x00001842
_LIT13: .word 0x00001743
_LIT14: .word 0x00001284
_LIT15: .word 0x000010ef
_LIT16: .word data_ov002_022cf0c4
_LIT17: .word 0x000015fb
_LIT18: .word 0x00001419
_LIT19: .word 0x0000165e
_LIT20: .word 0x0000187c
