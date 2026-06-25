; func_ov002_021c1ad0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern func_ov002_021b3240
        .extern func_ov002_021b9000
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb068
        .extern func_ov002_021bd6c8
        .global func_ov002_021c1ad0
        .arm
func_ov002_021c1ad0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r7, r1
    bl func_ov002_021b9ecc
    mov r6, #0x0
    cmp r0, #0x0
    moveq r0, r6
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r7, #0x5
    movge r0, r6
    ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5c4]
    cmp r1, #0x0
    movne r0, r6
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r2, _LIT1
    and r3, r8, #0x1
    mov r1, #0x14
    mul r4, r3, r2
    mul r5, r7, r1
    ldr r3, _LIT2
    add r1, r3, r4
    ldrh r1, [r5, r1]
    cmp r1, #0x0
    moveq r0, r6
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT3
    add r4, r1, r4
    ldr r1, [r4, r5]
    mov r1, r1, lsr #0x6
    tst r1, #0x1
    bne .L_194
    ldr r3, [r5, r4]
    mov r1, r3, lsr #0x2
    orr r1, r1, r3, lsr #0x1
    tst r1, #0x1
    bne .L_194
    ldr r1, _LIT4
    cmp r0, r1
    bgt .L_114
    bge .L_188
    ldr r3, _LIT5
    cmp r0, r3
    bgt .L_c8
    bge .L_160
    add r1, r2, #0xa40
    cmp r0, r1
    beq .L_160
    b .L_194
.L_c8:
    sub r2, r1, #0xf4
    cmp r0, r2
    bgt .L_e4
    sub r1, r1, #0xf4
    cmp r0, r1
    beq .L_188
    b .L_194
.L_e4:
    add r2, r3, #0x33c
    cmp r0, r2
    bgt .L_194
    sub r2, r1, #0x3c
    cmp r0, r2
    blt .L_194
    sub r1, r1, #0x3c
    cmp r0, r1
    addne r1, r3, #0x33c
    cmpne r0, r1
    beq .L_160
    b .L_194
.L_114:
    add r2, r1, #0x91
    cmp r0, r2
    bgt .L_134
    bge .L_188
    add r1, r1, #0x8f
    cmp r0, r1
    beq .L_188
    b .L_194
.L_134:
    add r2, r1, #0xd2
    cmp r0, r2
    bgt .L_150
    add r1, r1, #0xd2
    cmp r0, r1
    beq .L_190
    b .L_194
.L_150:
    add r1, r1, #0xd8
    cmp r0, r1
    beq .L_190
    b .L_194
.L_160:
    ldr r0, _LIT6
    bl func_ov002_021bd6c8
    cmp r0, #0x0
    beq .L_194
    ldr r0, [r4, r5]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_194
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_188:
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_190:
    orr r6, r6, #0x2
.L_194:
    ldr r2, _LIT7
    mov r0, r8
    mov r1, r7
    mov r3, r8
    bl func_ov002_021b3240
    cmp r0, #0x0
    rsb r4, r8, #0x1
    ldr r2, _LIT7
    mov r0, r8
    mov r1, r7
    mov r3, r4
    orrne r6, r6, #0x2
    bl func_ov002_021b3240
    cmp r0, #0x0
    mov r0, r8
    mov r1, r7
    orrne r6, r6, #0x1
    bl func_ov002_021b9000
    cmp r0, #0x0
    bne .L_228
    ldr r0, _LIT8
    bl func_ov002_021bb068
    cmp r0, #0x0
    movne r0, #0x3
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT9
    mov r0, r8
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    ldr r1, _LIT9
    mov r0, r4
    mvn r2, #0x0
    orrne r6, r6, #0x2
    bl func_ov002_021bae7c
    cmp r0, #0x0
    orrne r6, r6, #0x1
.L_228:
    mov r0, r6
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022cf1ac
_LIT4: .word 0x00001742
_LIT5: .word 0x000013cd
_LIT6: .word 0x000010f4
_LIT7: .word 0x00001693
_LIT8: .word 0x00001667
_LIT9: .word 0x000017a1
