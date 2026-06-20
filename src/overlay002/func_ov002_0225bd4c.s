; func_ov002_0225bd4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd4e0
        .extern data_ov002_022cd744
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021ae400
        .extern func_ov002_021ae664
        .extern func_ov002_021b9ecc
        .extern func_ov002_021be384
        .extern func_ov002_021d479c
        .extern func_ov002_021deb28
        .extern func_ov002_021df780
        .extern func_ov002_021df7cc
        .extern func_ov002_022592ec
        .extern func_ov002_0225a578
        .extern func_ov002_0225a66c
        .extern func_ov002_0225bcf4
        .extern func_ov002_0226b22c
        .extern func_ov002_02290500
        .global func_ov002_0225bd4c
        .arm
func_ov002_0225bd4c:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r1, [r2, #0xd30]
    cmp r1, #0x66
    bhi .L_44
    cmp r1, #0x64
    bcc .L_38
    beq .L_254
    cmp r1, #0x65
    beq .L_2a0
    cmp r1, #0x66
    beq .L_2fc
    b .L_370
.L_38:
    cmp r1, #0x0
    beq .L_60
    b .L_370
.L_44:
    cmp r1, #0xc8
    bhi .L_54
    beq .L_310
    b .L_370
.L_54:
    cmp r1, #0xc9
    beq .L_33c
    b .L_370
.L_60:
    ldr r1, _LIT1
    ldr r2, [r1, #0xc]
    cmp r2, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldr r1, [r1, #0x1c]
    mov r2, #0x1
    bl func_ov002_021be384
    cmp r0, #0x0
    bne .L_d0
    cmp r4, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, _LIT1
    orr r2, r1, #0x1b
    ldr r1, [r0, #0x1c]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021d479c
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0xd2c]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_d0:
    ldr r0, _LIT2
    bl func_ov002_0225a578
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0xc]
    ldr r2, _LIT3
    and r3, r4, #0x1
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul ip, r3, r2
    ldr r3, _LIT4
    ldr r2, _LIT5
    mul r0, r1, r0
    add r3, r3, ip
    ldr lr, [r0, r3]
    add ip, r2, ip
    mov r3, lr, lsr #0x6
    mov r2, lr, lsr #0x2
    and r3, r3, #0x1
    orr r2, r2, lr, lsr #0x1
    and r2, r2, #0x1
    ldrh ip, [r0, ip]
    mvn r3, r3
    mvn r0, r2
    and r2, ip, r3
    tst r2, r0
    beq .L_24c
    mov r0, r4
    bl func_ov002_021b9ecc
    ldr r2, _LIT6
    cmp r0, r2
    bgt .L_1a4
    bge .L_1fc
    sub r1, r2, #0xc2
    cmp r0, r1
    bgt .L_174
    bge .L_1e8
    ldr r1, _LIT7
    cmp r0, r1
    beq .L_210
    b .L_24c
.L_174:
    sub r1, r2, #0x10
    cmp r0, r1
    bgt .L_24c
    sub r1, r2, #0x12
    cmp r0, r1
    blt .L_24c
    subne r1, r2, #0x11
    cmpne r0, r1
    subne r1, r2, #0x10
    cmpne r0, r1
    beq .L_1d4
    b .L_24c
.L_1a4:
    add r1, r2, #0x16
    cmp r0, r1
    bgt .L_1c4
    bge .L_1d4
    add r1, r2, #0x11
    cmp r0, r1
    beq .L_1fc
    b .L_24c
.L_1c4:
    ldr r1, _LIT8
    cmp r0, r1
    beq .L_1e8
    b .L_24c
.L_1d4:
    mov r0, r4
    mov r1, #0x1f4
    bl func_ov002_021df780
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_1e8:
    mov r0, r4
    mov r1, #0x3e8
    bl func_ov002_021df780
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_1fc:
    ldr r0, _LIT0
    mov r1, #0x64
    str r1, [r0, #0xd30]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_210:
    ldr r0, _LIT9
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x1
    bne .L_230
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_238
.L_230:
    mov r0, #0x38
    bl func_ov002_021ae664
.L_238:
    ldr r0, _LIT0
    mov r1, #0xc8
    str r1, [r0, #0xd30]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_24c:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_254:
    mov r1, #0xe0
    bl func_ov002_021ae400
    ldr r0, _LIT9
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x1
    bne .L_280
    ldr r2, _LIT10
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_02290500
    b .L_288
.L_280:
    ldr r0, _LIT10
    bl func_ov002_022592ec
.L_288:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd30]
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r4, pc}
.L_2a0:
    ldr r0, [r2, #0xd50]
    cmp r0, #0x0
    beq .L_2e4
    ldr r0, [r2, #0xd64]
    cmp r0, #0xb
    bne .L_2e4
    ldr r3, [r2, #0xd74]
    ldr r1, [r2, #0xd78]
    ldr r0, [r2, #0xd70]
    add r1, r3, r1
    bl func_ov002_021deb28
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd30]
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r4, pc}
.L_2e4:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd30]
    sub r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r4, pc}
.L_2fc:
    bl func_ov002_0225a66c
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_310:
    ldr r1, _LIT1
    ldr r3, [r2, #0xd44]
    ldr r1, [r1, #0x1c]
    mov r2, #0x1
    bl func_ov002_0226b22c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd30]
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r4, pc}
.L_33c:
    ldr r1, _LIT11
    ldrh r1, [r1, #0xb2]
    cmp r1, #0x0
    bne .L_368
    ldr r1, _LIT3
    and r2, r4, #0x1
    mul r3, r2, r1
    ldr r1, _LIT12
    ldr r1, [r1, r3]
    mov r1, r1, asr #0x1
    bl func_ov002_021df7cc
.L_368:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_370:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cd3f4
_LIT2: .word data_ov002_022cd4e0
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf1ac
_LIT5: .word data_ov002_022cf1a4
_LIT6: .word 0x0000128f
_LIT7: .word 0x00001115
_LIT8: .word 0x000018a4
_LIT9: .word data_ov002_022cd744
_LIT10: .word func_ov002_0225bcf4
_LIT11: .word data_ov002_022d0e6c
_LIT12: .word data_ov002_022cf16c
