; func_ov002_021bff50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1a8
        .extern data_ov002_022cf1ac
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b4120
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bd198
        .extern func_ov002_021c1d4c
        .global func_ov002_021bff50
        .arm
func_ov002_021bff50:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, r0
    mov r4, r1
    bl func_ov002_021c1d4c
    mov r1, #0x14
    ldr r2, _LIT0
    and r3, r5, #0x1
    mul r9, r3, r2
    ldr r3, _LIT1
    ldr r2, _LIT2
    mul r8, r4, r1
    add r6, r3, r9
    ldr r7, [r6, r8]
    add r3, r2, r9
    mov r2, r7, lsr #0x6
    mov r1, r7, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, r7, lsr #0x1
    and r1, r1, #0x1
    ldrh r3, [r8, r3]
    mvn r2, r2
    mvn r1, r1
    and r2, r3, r2
    mov r7, r0
    tst r2, r1
    beq .L_1b4
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9ecc
    ldr r3, _LIT3
    cmp r0, r3
    bgt .L_e8
    bge .L_16c
    ldr r2, _LIT4
    cmp r0, r2
    bgt .L_c4
    bge .L_16c
    sub r1, r2, #0x26
    cmp r0, r1
    bgt .L_1b4
    sub r1, r2, #0x28
    cmp r0, r1
    blt .L_1b4
    subne r1, r2, #0x27
    cmpne r0, r1
    subne r1, r2, #0x26
    cmpne r0, r1
    beq .L_16c
    b .L_1b4
.L_c4:
    add r1, r2, #0x1d8
    cmp r0, r1
    bgt .L_d8
    beq .L_12c
    b .L_1b4
.L_d8:
    add r1, r2, #0x260
    cmp r0, r1
    beq .L_134
    b .L_1b4
.L_e8:
    ldr r2, _LIT5
    cmp r0, r2
    bgt .L_108
    bge .L_134
    sub r1, r2, #0x314
    cmp r0, r1
    beq .L_134
    b .L_1b4
.L_108:
    add r1, r2, #0xf6
    cmp r0, r1
    bgt .L_11c
    beq .L_134
    b .L_1b4
.L_11c:
    ldr r1, _LIT6
    cmp r0, r1
    beq .L_184
    b .L_1b4
.L_12c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_134:
    ldr r0, [r6, r8]
    mov r0, r0, lsr #0x16
    tst r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r2, _LIT7
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b4120
    mvn r1, #0x0
    cmp r0, r1
    beq .L_1b4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_16c:
    rsb r0, r5, #0x1
    bl func_ov002_021bd198
    cmp r0, #0x0
    beq .L_1b4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_184:
    ldr r0, _LIT8
    add r0, r0, r9
    ldr r0, [r8, r0]
    cmp r0, #0x0
    beq .L_1b4
    mov r0, r5
    mov r1, r4
    sub r2, r3, #0x45
    bl func_ov002_021b4120
    cmp r0, #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1b4:
    ldr r2, _LIT9
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_1ec
    ldr r2, _LIT9
    rsb r0, r5, #0x1
    mov r1, #0xb
    bl func_ov002_021b4120
    mvn r1, #0x0
    cmp r0, r1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1ec:
    and r0, r7, #0x2
    cmp r0, #0x0
    bgt .L_254
    rsb r8, r5, #0x1
    ldr r2, _LIT10
    ldr r0, _LIT0
    and r1, r8, #0x1
    mla r0, r1, r0, r2
    ldr r9, _LIT11
    add r7, r0, #0x30
    mov r6, #0x0
.L_218:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_244
    mov r0, r8
    mov r1, r6
    mov r2, r9
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_244:
    add r6, r6, #0x1
    cmp r6, #0x4
    add r7, r7, #0x14
    ble .L_218
.L_254:
    ldr r2, _LIT12
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r2, _LIT13
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r2, _LIT14
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r2, _LIT15
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1ac
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word 0x0000154a
_LIT4: .word 0x000012a5
_LIT5: .word 0x00001958
_LIT6: .word 0x00001a79
_LIT7: .word 0x00001505
_LIT8: .word data_ov002_022cf1a8
_LIT9: .word 0x000015ff
_LIT10: .word data_ov002_022cf16c
_LIT11: .word 0x000017fc
_LIT12: .word 0x00001619
_LIT13: .word 0x00001890
_LIT14: .word 0x00001669
_LIT15: .word 0x0000195b
