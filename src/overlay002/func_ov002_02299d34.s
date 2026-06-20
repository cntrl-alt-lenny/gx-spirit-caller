; func_ov002_02299d34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104c68
        .extern data_ov002_022cd73c
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0f2c
        .global func_ov002_02299d34
        .arm
func_ov002_02299d34:
    stmdb sp!, {r4, r5, r6, lr}
    ldr ip, _LIT0
    mov r1, #0x8
    ldr r4, [ip, #0xb88]
    mov r0, #0xd
    cmp r4, #0x2
    beq .L_30
    ldr r3, _LIT1
    ldr r2, _LIT2
    ldr r3, [r3, #0xcf4]
    cmp r3, r2
    beq .L_38
.L_30:
    mov r0, #0xc
    ldmia sp!, {r4, r5, r6, pc}
.L_38:
    cmp r4, #0x3
    moveq r0, #0x1b
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r2, _LIT3
    ldr r4, _LIT4
    ldr r3, [r2, #0x4]
    eor r5, r3, #0x1
    ldr r2, [r4, r5, lsl #0x2]
    cmp r2, #0x5f
    addls pc, pc, r2, lsl #0x2
    b .L_24c
    b .L_1e4
    b .L_1f8
    b .L_1f8
    b .L_1f8
    b .L_1fc
    b .L_200
    b .L_208
    b .L_200
    b .L_1fc
    b .L_1fc
    b .L_200
    b .L_200
    b .L_200
    b .L_208
    b .L_208
    b .L_208
    b .L_200
    b .L_200
    b .L_200
    b .L_208
    b .L_1fc
    b .L_200
    b .L_200
    b .L_1fc
    b .L_210
    b .L_210
    b .L_210
    b .L_210
    b .L_210
    b .L_210
    b .L_218
    b .L_218
    b .L_218
    b .L_218
    b .L_218
    b .L_218
    b .L_218
    b .L_218
    b .L_218
    b .L_218
    b .L_218
    b .L_218
    b .L_218
    b .L_218
    b .L_218
    b .L_218
    b .L_218
    b .L_220
    b .L_238
    b .L_220
    b .L_220
    b .L_220
    b .L_22c
    b .L_22c
    b .L_22c
    b .L_22c
    b .L_22c
    b .L_22c
    b .L_22c
    b .L_22c
    b .L_22c
    b .L_244
    b .L_200
    b .L_238
    b .L_238
    b .L_200
    b .L_200
    b .L_208
    b .L_208
    b .L_1f8
    b .L_1f8
    b .L_200
    b .L_220
    b .L_218
    b .L_208
    b .L_1f8
    b .L_220
    b .L_220
    b .L_220
    b .L_220
    b .L_220
    b .L_220
    b .L_220
    b .L_220
    b .L_220
    b .L_220
    b .L_220
    b .L_220
    b .L_220
    b .L_220
    b .L_220
    b .L_220
    b .L_220
    b .L_220
    b .L_218
    b .L_244
.L_1e4:
    ldr r0, [ip, #0xc38]
    and r0, r0, #0x7
    cmp r0, #0x5
    addgt r0, r0, #0x7
    b .L_24c
.L_1f8:
    mov r0, #0x2
.L_1fc:
    b .L_24c
.L_200:
    mov r0, #0x0
    b .L_24c
.L_208:
    mov r0, #0x1
    b .L_24c
.L_210:
    mov r0, #0xe
    b .L_24c
.L_218:
    mov r0, #0x4
    b .L_24c
.L_220:
    mov r0, #0x3
    mov r1, #0xa
    b .L_24c
.L_22c:
    mov r0, #0x5
    mov r1, #0xa
    b .L_24c
.L_238:
    mov r0, #0x6
    mov r1, #0xa
    b .L_24c
.L_244:
    mov r0, #0x7
    mov r1, #0xa
.L_24c:
    ldr ip, _LIT5
    mov r2, #0x0
    ldr r4, [ip, #0xd8]
    sub r4, r4, #0x8
    cmp r4, #0x3
    addls pc, pc, r4, lsl #0x2
    b .L_284
    b .L_278
    b .L_280
    b .L_278
    b .L_280
.L_278:
    mov r2, #0x1
    b .L_284
.L_280:
    sub r2, r2, #0x1
.L_284:
    ldr ip, _LIT6
    and r4, r5, #0x1
    and r3, r3, #0x1
    mul r6, r4, ip
    ldr r5, _LIT7
    mul lr, r3, ip
    ldr r4, [r5, r6]
    ldr lr, [r5, lr]
    add r3, ip, #0x350
    sub r4, r4, lr
    cmp r4, r3
    bge .L_2c4
    cmp r4, #0x3e8
    blt .L_2cc
    cmp r2, #0x0
    bge .L_2cc
.L_2c4:
    add r0, r1, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_2cc:
    ldr r3, _LIT8
    cmp r4, r3
    ble .L_2ec
    add r3, r3, #0x7d0
    cmp r4, r3
    ldmgtia sp!, {r4, r5, r6, pc}
    cmp r2, #0x0
    ldmleia sp!, {r4, r5, r6, pc}
.L_2ec:
    mov r0, r1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_ov002_022d016c
_LIT2: .word 0x0000ffff
_LIT3: .word data_ov002_022cd73c
_LIT4: .word data_02104c68
_LIT5: .word data_ov002_022d0f2c
_LIT6: .word 0x00000868
_LIT7: .word data_ov002_022cf16c
_LIT8: .word 0xfffff448
