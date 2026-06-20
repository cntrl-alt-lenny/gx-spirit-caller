; func_ov002_02283908 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd544
        .extern data_ov002_022cd548
        .extern data_ov002_022cd550
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1a8
        .extern func_ov002_021b9ecc
        .global func_ov002_02283908
        .arm
func_ov002_02283908:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_ov002_021b9ecc
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_80
    bge .L_120
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_44
    bge .L_d8
    sub r1, r2, #0xbc
    cmp r0, r1
    beq .L_d8
    b .L_290
.L_44:
    sub r1, r3, #0x8d
    cmp r0, r1
    bgt .L_58
    beq .L_1b8
    b .L_290
.L_58:
    add r1, r2, #0x1f8
    cmp r0, r1
    bgt .L_290
    sub r1, r3, #0x8
    cmp r0, r1
    blt .L_290
    addne r1, r2, #0x1f8
    cmpne r0, r1
    beq .L_d8
    b .L_290
.L_80:
    add r1, r3, #0x114
    cmp r0, r1
    bgt .L_b4
    bge .L_208
    add r1, r3, #0x44
    cmp r0, r1
    bgt .L_a4
    beq .L_d8
    b .L_290
.L_a4:
    add r1, r3, #0x4a
    cmp r0, r1
    beq .L_d8
    b .L_290
.L_b4:
    add r1, r3, #0x184
    cmp r0, r1
    bgt .L_c8
    beq .L_168
    b .L_290
.L_c8:
    ldr r1, _LIT2
    cmp r0, r1
    beq .L_22c
    b .L_290
.L_d8:
    rsb r0, r6, #0x1
    and r2, r0, #0x1
    ldr r1, _LIT3
    mov r0, #0x14
    mul r3, r2, r1
    mul r2, r4, r0
    ldr r1, _LIT4
    add r0, r1, r3
    ldrh r1, [r2, r0]
    mov r0, #0x0
    cmp r1, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, _LIT5
    add r1, r1, r3
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    movne r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_120:
    rsb r0, r6, #0x1
    and r2, r0, #0x1
    ldr r1, _LIT3
    mov r0, #0x14
    mul r3, r2, r1
    mul r2, r4, r0
    ldr r1, _LIT4
    add r0, r1, r3
    ldrh r1, [r2, r0]
    mov r0, #0x0
    cmp r1, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, _LIT5
    add r1, r1, r3
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    movne r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_168:
    rsb r1, r6, #0x1
    mov r2, #0x14
    ldr r0, _LIT3
    ldr r3, _LIT4
    and r5, r1, #0x1
    mul r2, r4, r2
    mla r0, r5, r0, r3
    ldrh r2, [r2, r0]
    mov r0, #0x0
    cmp r2, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r5, _LIT6
    mov r2, #0xdc
    mov r3, #0x2c
    mul r3, r4, r3
    mla r2, r1, r2, r5
    ldr r1, [r3, r2]
    cmp r1, #0x3
    movle r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1b8:
    rsb r1, r6, #0x1
    mov r2, #0x14
    ldr r0, _LIT3
    ldr r3, _LIT5
    and r5, r1, #0x1
    mul r2, r4, r2
    mla r0, r5, r0, r3
    ldrh r2, [r2, r0]
    mov r0, #0x0
    cmp r2, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r5, _LIT7
    mov r2, #0xdc
    mov r3, #0x2c
    mul r3, r4, r3
    mla r2, r1, r2, r5
    ldr r1, [r3, r2]
    cmp r1, #0x7d0
    movge r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_208:
    rsb r3, r6, #0x1
    mov r1, #0x14
    ldr r0, _LIT3
    ldr r2, _LIT5
    and r3, r3, #0x1
    mul r1, r4, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_22c:
    rsb r1, r6, #0x1
    mov lr, #0x14
    ldr ip, _LIT3
    ldr r0, _LIT4
    and r3, r1, #0x1
    mul r2, r4, lr
    mla r0, r3, ip, r0
    ldrh r2, [r2, r0]
    mov r0, #0x0
    cmp r2, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r9, _LIT8
    mov r3, #0x2c
    ldr r7, _LIT9
    mov r2, #0xdc
    mul r8, r4, r3
    mla r3, r1, r2, r9
    and r6, r6, #0x1
    mul r2, r5, lr
    mla r1, r6, ip, r7
    ldr r3, [r8, r3]
    ldr r1, [r2, r1]
    tst r3, r1
    movne r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_290:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x000017df
_LIT1: .word 0x000015e0
_LIT2: .word 0x000019c2
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf1a4
_LIT5: .word data_ov002_022cf1a2
_LIT6: .word data_ov002_022cd548
_LIT7: .word data_ov002_022cd550
_LIT8: .word data_ov002_022cd544
_LIT9: .word data_ov002_022cf1a8
