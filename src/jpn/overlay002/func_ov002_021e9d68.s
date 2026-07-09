; func_ov002_021e9d68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern data_ov002_022d008c
        .extern func_0202ea74
        .extern func_ov002_021b8f20
        .extern func_ov002_021b9dec
        .extern func_ov002_021c1d64
        .extern func_ov002_021c8400
        .global func_ov002_021e9d68
        .arm
func_ov002_021e9d68:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r2
    mov r8, r0
    cmp r6, #0x5
    mov r7, r1
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r4, _LIT0
    and ip, r7, #0x1
    mul r5, ip, r4
    mov r3, #0x14
    mul r4, r6, r3
    ldr ip, _LIT1
    add r3, ip, r5
    add r3, r3, r4
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r3, _LIT2
    add r3, r3, r5
    ldrh r3, [r4, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_ov002_021c1d64
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r8]
    ldr r2, _LIT3
    cmp r0, r2
    bgt .L_444
    bge .L_48c
    ldr r1, _LIT4
    cmp r0, r1
    bgt .L_434
    beq .L_48c
    b .L_550
.L_434:
    add r1, r1, #0x314
    cmp r0, r1
    beq .L_494
    b .L_550
.L_444:
    cmp r0, #0x1840
    bgt .L_47c
    bge .L_4f4
    add r1, r2, #0xd5
    cmp r0, r1
    bgt .L_550
    add r1, r2, #0xd2
    cmp r0, r1
    blt .L_550
    beq .L_4cc
    add r1, r2, #0xd5
    cmp r0, r1
    beq .L_4b4
    b .L_550
.L_47c:
    ldr r1, _LIT5
    cmp r0, r1
    beq .L_514
    b .L_550
.L_48c:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_494:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c8400
    ldrh r1, [r8, #0xc]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_4b4:
    ldr r0, _LIT6
    ldr r0, [r0, #0xcec]
    cmp r7, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_4cc:
    ldr r0, _LIT7
    add r0, r0, r5
    ldrh r0, [r4, r0]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b8f20
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_4f4:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b9dec
    ldr r1, _LIT8
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_514:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b9dec
    bl func_0202ea74
    cmp r0, #0x0
    beq .L_548
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b9dec
    ldr r1, _LIT9
    cmp r0, r1
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_548:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_550:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x000016e1
_LIT4: .word 0x000012cb
_LIT5: .word 0x00001988
_LIT6: .word data_ov002_022d008c
_LIT7: .word data_ov002_022cf0c2
_LIT8: .word 0x00000fe5
_LIT9: .word 0x000018a7
