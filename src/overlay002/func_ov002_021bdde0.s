; func_ov002_021bdde0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1a8
        .extern data_ov002_022cf1ac
        .extern func_ov002_021b314c
        .extern func_ov002_021b3314
        .extern func_ov002_021b3e28
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b4054
        .extern func_ov002_021b4120
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bbf50
        .extern func_ov002_021bd6c8
        .extern func_ov002_021c2f24
        .global func_ov002_021bdde0
        .arm
func_ov002_021bdde0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r3, _LIT0
    and r4, r7, #0x1
    mul r5, r4, r3
    mov r6, r1
    mov r2, #0x14
    mul r4, r6, r2
    ldr r3, _LIT1
    add r2, r3, r5
    ldr r2, [r4, r2]
    mov r3, r2, lsr #0x16
    tst r3, #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r3, r2, lsr #0x17
    tst r3, #0x1
    bne .L_270
    ldr r3, _LIT2
    mov ip, r2, lsr #0x6
    add lr, r3, r5
    mov r3, r2, lsr #0x2
    and ip, ip, #0x1
    orr r2, r3, r2, lsr #0x1
    and r2, r2, #0x1
    ldrh lr, [r4, lr]
    mvn r3, ip
    mvn r2, r2
    and r3, lr, r3
    tst r3, r2
    beq .L_1fc
    bl func_ov002_021b9ecc
    ldr r3, _LIT3
    cmp r0, r3
    bgt .L_e8
    bge .L_158
    ldr r2, _LIT4
    cmp r0, r2
    bgt .L_c4
    bge .L_170
    sub r1, r2, #0xcb
    cmp r0, r1
    bgt .L_b4
    beq .L_168
    b .L_1fc
.L_b4:
    sub r1, r2, #0x7
    cmp r0, r1
    beq .L_19c
    b .L_1fc
.L_c4:
    sub r1, r3, #0x45
    cmp r0, r1
    bgt .L_d8
    beq .L_168
    b .L_1fc
.L_d8:
    sub r1, r3, #0x2c
    cmp r0, r1
    beq .L_168
    b .L_1fc
.L_e8:
    ldr r2, _LIT5
    cmp r0, r2
    bgt .L_11c
    bge .L_1b4
    ldr r1, _LIT6
    cmp r0, r1
    bgt .L_10c
    beq .L_168
    b .L_1fc
.L_10c:
    add r1, r1, #0x43
    cmp r0, r1
    beq .L_168
    b .L_1fc
.L_11c:
    add r1, r2, #0x6a
    cmp r0, r1
    bgt .L_130
    beq .L_168
    b .L_1fc
.L_130:
    add r1, r2, #0xf5
    cmp r0, r1
    bgt .L_1fc
    add r1, r2, #0xf4
    cmp r0, r1
    blt .L_1fc
    addne r1, r2, #0xf5
    cmpne r0, r1
    beq .L_170
    b .L_1fc
.L_158:
    ldr r0, _LIT7
    bl func_ov002_021bd6c8
    cmp r0, #0x0
    beq .L_1fc
.L_168:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_170:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b9ecc
    mov r2, r0
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_1fc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_19c:
    rsb r0, r7, #0x1
    bl func_ov002_021bbf50
    cmp r0, #0x0
    beq .L_1fc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1b4:
    rsb r0, r7, #0x1
    bl func_ov002_021bbf50
    cmp r0, #0x0
    beq .L_1fc
    ldr r1, _LIT8
    ldr r0, _LIT9
    add r1, r1, r5
    add r1, r1, #0x30
    ldr r1, [r1, r4]
    ldr r2, [r0, #0x28]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    cmp r2, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_1fc:
    ldr r2, _LIT10
    mov r0, r7
    mov r1, r6
    mov r3, #0x4
    bl func_ov002_021b4054
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, _LIT11
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b314c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, _LIT12
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, _LIT13
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
.L_270:
    ldr r2, _LIT14
    mov r0, r7
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b9ecc
    ldr r1, _LIT15
    cmp r0, r1
    bne .L_2f0
    mov r0, r7
    add r2, r1, #0xb5
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_2f0
    ldr r2, _LIT15
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b3e28
    mov r4, r0
    ldr r2, _LIT16
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b4120
    cmp r4, r0
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2f0:
    ldr r1, _LIT1
    ldr r0, _LIT2
    add r1, r1, r5
    ldr r3, [r4, r1]
    add r2, r0, r5
    mov r1, r3, lsr #0x6
    mov r0, r3, lsr #0x2
    and r1, r1, #0x1
    orr r0, r0, r3, lsr #0x1
    and r0, r0, #0x1
    ldrh r2, [r4, r2]
    mvn r1, r1
    mvn r0, r0
    and r1, r2, r1
    tst r1, r0
    beq .L_494
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b9ecc
    ldr r2, _LIT17
    cmp r0, r2
    bgt .L_37c
    bge .L_3ac
    sub r1, r2, #0x314
    cmp r0, r1
    bgt .L_36c
    bge .L_3ac
    ldr r1, _LIT18
    cmp r0, r1
    beq .L_3ac
    b .L_494
.L_36c:
    sub r1, r2, #0xec
    cmp r0, r1
    beq .L_3cc
    b .L_494
.L_37c:
    add r1, r2, #0xf6
    cmp r0, r1
    bgt .L_39c
    bge .L_434
    add r1, r2, #0x69
    cmp r0, r1
    beq .L_400
    b .L_494
.L_39c:
    ldr r1, _LIT19
    cmp r0, r1
    beq .L_47c
    b .L_494
.L_3ac:
    ldr r2, _LIT18
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b4120
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_3cc:
    mov r0, r7
    mov r1, r6
    sub r2, r2, #0xec
    bl func_ov002_021b3e28
    mov r4, r0
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b3314
    add r0, r0, #0x1
    cmp r4, r0
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_400:
    mov r0, r7
    mov r1, r6
    add r2, r2, #0x69
    bl func_ov002_021b3e28
    mov r4, r0
    ldr r1, _LIT20
    mov r0, r7
    bl func_ov002_021c2f24
    add r0, r0, #0x1
    cmp r4, r0
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_434:
    ldr r2, _LIT18
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b4120
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, _LIT21
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b3e28
    ldr r1, _LIT22
    add r1, r1, r5
    ldr r1, [r4, r1]
    cmp r0, r1
    movcs r0, #0x1
    movcc r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_47c:
    ldr r0, _LIT22
    add r0, r0, r5
    ldr r0, [r4, r0]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
.L_494:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1ac
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word 0x0000174f
_LIT4: .word 0x000014dc
_LIT5: .word 0x000019f8
_LIT6: .word 0x000018b9
_LIT7: .word 0x000010f4
_LIT8: .word data_ov002_022cf16c
_LIT9: .word data_ov002_022cd3f4
_LIT10: .word 0x000016cb
_LIT11: .word 0x00001661
_LIT12: .word 0x000018cb
_LIT13: .word 0x000019ab
_LIT14: .word 0x000015ff
_LIT15: .word 0x000018a6
_LIT16: .word 0x0000195b
_LIT17: .word 0x00001958
_LIT18: .word 0x00001505
_LIT19: .word 0x00001a79
_LIT20: .word 0x000019c1
_LIT21: .word 0x00001a4e
_LIT22: .word data_ov002_022cf1a8
