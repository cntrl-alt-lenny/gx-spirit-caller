; func_ov002_021c0be4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a8
        .extern data_ov002_022cf1ac
        .extern func_ov002_021b31b8
        .extern func_ov002_021b3ecc
        .extern func_ov002_021ba034
        .extern func_ov002_021bae7c
        .extern func_ov002_021c1ad0
        .extern func_ov002_021c1d4c
        .extern func_ov002_021c8940
        .global func_ov002_021c0be4
        .arm
func_ov002_021c0be4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    mov r5, r1
    bl func_ov002_021ba034
    mov r2, #0x14
    ldr r3, _LIT0
    and r4, r6, #0x1
    mul r1, r4, r3
    ldr r4, _LIT1
    mul r2, r5, r2
    add r4, r4, r1
    ldr ip, [r2, r4]
    mov r4, r0
    mov r0, ip, lsr #0x6
    tst r0, #0x1
    bne .L_ab0
    ldr ip, _LIT2
    cmp r4, ip
    bgt .L_994
    bge .L_a6c
    add r0, r3, #0xd20
    cmp r4, r0
    bgt .L_93c
    bge .L_a6c
    ldr r1, _LIT3
    cmp r4, r1
    bgt .L_918
    bge .L_a6c
    sub r0, r1, #0x77
    cmp r4, r0
    beq .L_a6c
    b .L_ab0
.L_918:
    add r0, r1, #0xc0
    cmp r4, r0
    bgt .L_92c
    beq .L_a6c
    b .L_ab0
.L_92c:
    ldr r0, _LIT4
    cmp r4, r0
    beq .L_a74
    b .L_ab0
.L_93c:
    sub r0, ip, #0x1ac
    cmp r4, r0
    bgt .L_970
    bge .L_a6c
    ldr r0, _LIT5
    cmp r4, r0
    bgt .L_960
    beq .L_a6c
    b .L_ab0
.L_960:
    add r0, r0, #0x3a
    cmp r4, r0
    beq .L_a6c
    b .L_ab0
.L_970:
    add r0, r3, #0xec0
    cmp r4, r0
    bgt .L_984
    beq .L_a6c
    b .L_ab0
.L_984:
    sub r0, ip, #0x76
    cmp r4, r0
    beq .L_a6c
    b .L_ab0
.L_994:
    ldr r3, _LIT6
    cmp r4, r3
    bgt .L_a18
    bge .L_a94
    sub r0, r3, #0xaf
    cmp r4, r0
    bgt .L_9f4
    sub r0, r3, #0xb2
    subs r0, r4, r0
    addpl pc, pc, r0, lsl #0x2
    b .L_9d0
    b .L_a74
    b .L_a74
    b .L_a74
    b .L_a74
.L_9d0:
    ldr r0, _LIT7
    cmp r4, r0
    bgt .L_9e4
    beq .L_a6c
    b .L_ab0
.L_9e4:
    add r0, r0, #0x50
    cmp r4, r0
    beq .L_a6c
    b .L_ab0
.L_9f4:
    sub r0, r3, #0x8c
    cmp r4, r0
    bgt .L_a08
    beq .L_a6c
    b .L_ab0
.L_a08:
    sub r0, r3, #0x54
    cmp r4, r0
    beq .L_a6c
    b .L_ab0
.L_a18:
    add r0, r3, #0x8e
    cmp r4, r0
    bgt .L_a4c
    bge .L_a6c
    add r0, r3, #0x4
    cmp r4, r0
    bgt .L_a3c
    beq .L_a6c
    b .L_ab0
.L_a3c:
    add r0, r3, #0x36
    cmp r4, r0
    beq .L_a6c
    b .L_ab0
.L_a4c:
    add r0, r3, #0x91
    cmp r4, r0
    bgt .L_a60
    beq .L_a6c
    b .L_ab0
.L_a60:
    add r0, ip, #0x280
    cmp r4, r0
    bne .L_ab0
.L_a6c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_a74:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_ab0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_a94:
    ldr r3, _LIT8
    add r0, ip, #0x71
    add r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, r0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_ab0:
    ldr r2, _LIT9
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r6
    mov r1, r5
    bl func_ov002_021c1d4c
    and r7, r0, #0x1
    cmp r7, #0x0
    bgt .L_b00
    ldr r2, _LIT10
    mov r0, r6
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
.L_b00:
    mov r0, r6
    mov r1, r5
    bl func_ov002_021c8940
    cmp r0, #0x1
    bgt .L_b1c
    beq .L_b58
    b .L_b7c
.L_b1c:
    cmp r0, #0x10
    bgt .L_b7c
    cmp r0, #0xb
    blt .L_b7c
    cmpne r0, #0xc
    cmpne r0, #0x10
    bne .L_b7c
    ldr r1, _LIT11
    mov r0, r6
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_b7c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_b58:
    cmp r7, #0x0
    bgt .L_b7c
    ldr r1, _LIT12
    mov r0, r6
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
.L_b7c:
    mov r0, r6
    mov r1, r5
    bl func_ov002_021c1ad0
    and r0, r0, #0x1
    cmp r0, #0x0
    bgt .L_c6c
    ldr r1, _LIT13
    cmp r4, r1
    addne r0, r1, #0x1
    cmpne r4, r0
    addne r0, r1, #0x4b0
    cmpne r4, r0
    bne .L_bcc
    ldr r1, _LIT14
    mov r0, r6
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
.L_bcc:
    ldr r2, _LIT15
    mov r0, r6
    mov r1, r5
    mov r3, r6
    bl func_ov002_021b31b8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, _LIT16
    mov r0, r6
    mov r1, r5
    mov r3, r6
    bl func_ov002_021b31b8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, _LIT17
    mov r0, r6
    mov r1, r5
    mov r3, r6
    bl func_ov002_021b31b8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, _LIT18
    mov r0, r6
    mov r1, r5
    mov r3, r6
    bl func_ov002_021b31b8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, _LIT19
    mov r0, r6
    mov r1, r5
    mov r3, r6
    bl func_ov002_021b31b8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
.L_c6c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1ac
_LIT2: .word 0x000018ab
_LIT3: .word 0x00001416
_LIT4: .word 0x0000154c
_LIT5: .word 0x00001651
_LIT6: .word 0x00001a1d
_LIT7: .word 0x000018fd
_LIT8: .word data_ov002_022cf1a8
_LIT9: .word 0x00001a0f
_LIT10: .word 0x000015f2
_LIT11: .word 0x000016fc
_LIT12: .word 0x000014e3
_LIT13: .word 0x00000fcb
_LIT14: .word 0x0000187d
_LIT15: .word 0x00001408
_LIT16: .word 0x00001625
_LIT17: .word 0x00001496
_LIT18: .word 0x000015ce
_LIT19: .word 0x00001620
