; func_ov004_021cb1b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104c18
        .extern data_ov000_021b333c
        .extern data_ov000_021b3ed8
        .extern data_ov000_021b3f48
        .extern data_ov004_0220b2a0
        .extern data_ov004_02211230
        .extern func_02000ef8
        .extern func_02001b84
        .extern func_020057c0
        .extern func_02005c44
        .extern func_020068fc
        .extern func_02007188
        .extern func_020125e8
        .extern func_0201cf8c
        .extern func_0201cfec
        .extern func_0201d00c
        .extern func_0202aeec
        .extern func_0202c158
        .extern func_020325d0
        .extern func_0208c79c
        .extern func_0208e2f4
        .extern func_ov004_021c9eb4
        .global func_ov004_021cb1b0
        .arm
func_ov004_021cb1b0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r1, #0x3f
    ldr r0, _LIT0
    sub r2, r1, #0x4f
    ldr r4, _LIT1
    bl func_0208e2f4
    mov r1, #0x3f
    ldr r0, _LIT2
    sub r2, r1, #0x4f
    bl func_0208e2f4
    ldr r0, _LIT3
    mov r1, #0x0
    bl func_0208c79c
    ldr r0, _LIT4
    mov r1, #0x0
    bl func_0208c79c
    ldr r0, _LIT5
    bl func_ov004_021c9eb4
    mov r0, #0x1
    bl func_02005c44
    mov r0, #0x2
    bl func_02005c44
    bl func_02001b84
    bl func_0202c158
    bl func_0202aeec
    bl func_020068fc
    ldr r0, _LIT6
    ldr r0, [r0, #0x4c]
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_228
    b .L_228
    b .L_228
    b .L_228
    b .L_228
    b .L_228
    b .L_a0
    b .L_16c
    b .L_1ac
    b .L_17c
.L_a0:
    bl func_0201d00c
    cmp r0, #0x0
    beq .L_228
    ldr r3, _LIT7
    ldr r0, _LIT8
    ldr r4, [r3, #0xc38]
    mov r2, #0x12
    umull r0, r1, r4, r0
    mov r1, r1, lsr #0x2
    umull r0, r1, r2, r1
    sub r1, r4, r0
    str r1, [r3, #0xb84]
    bl func_0201cf8c
    cmp r0, #0x0
    beq .L_f4
    ldr r0, _LIT7
    mov r1, #0x0
    str r1, [r0, #0xc3c]
    str r1, [r0, #0xc40]
    mov r1, #0x2
    b .L_10c
.L_f4:
    ldr r0, _LIT7
    mov r1, #0x1
    str r1, [r0, #0xc3c]
    mov r1, #0x2
    str r1, [r0, #0xc40]
    mov r1, #0x0
.L_10c:
    str r1, [r0, #0xc44]
    ldr r0, _LIT7
    mov r1, #0x0
    str r1, [r0, #0xbbc]
    str r1, [r0, #0xbc0]
    str r1, [r0, #0xbb0]
    sub r1, r1, #0x1
    str r1, [r0, #0xbb4]
    mov r1, #0x2
    str r1, [r0, #0xc48]
    bl func_0201cfec
    cmp r0, #0x2
    ldreq r0, _LIT7
    moveq r1, #0x1
    ldrne r0, _LIT7
    movne r1, #0x0
    str r1, [r0, #0xb88]
    ldr r1, _LIT7
    mov r2, #0x0
    ldr r0, _LIT9
    str r2, [r1, #0xba0]
    bl func_020057c0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_16c:
    ldr r0, _LIT9
    bl func_020057c0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_17c:
    bl func_0201cfec
    cmp r0, #0x4
    mov r0, #0x5
    mov r1, #0x6
    bne .L_19c
    ldr r2, _LIT10
    bl func_02007188
    b .L_1a4
.L_19c:
    ldr r2, _LIT11
    bl func_02007188
.L_1a4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_1ac:
    mov lr, #0x0
    ldr r0, _LIT12
    mov r1, r4
    mov ip, lr
.L_1bc:
    add r2, r4, lr, lsl #0x2
    add r2, r2, #0x3000
    ldr r2, [r2, #0xc0c]
    mov r5, ip
    str r2, [r0]
    cmp r2, #0x0
    bls .L_1fc
.L_1d8:
    add r2, r1, r5, lsl #0x2
    add r2, r2, #0x3000
    ldr r3, [r2, #0xc14]
    add r2, r0, r5, lsl #0x1
    strh r3, [r2, #0xc]
    ldr r2, [r0]
    add r5, r5, #0x1
    cmp r5, r2
    bcc .L_1d8
.L_1fc:
    add lr, lr, #0x1
    cmp lr, #0x2
    add r0, r0, #0x108
    add r1, r1, #0x28
    blt .L_1bc
    ldr r2, _LIT13
    mov r0, #0x5
    mov r1, #0x6
    bl func_02007188
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_228:
    ldr r1, _LIT7
    mvn r2, #0x0
    mov r0, #0x0
    str r2, [r1, #0xbac]
    bl func_020325d0
    bl func_02000ef8
    cmp r0, #0x0
    movne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x04000050
_LIT1: .word data_ov004_0220b2a0
_LIT2: .word 0x04001050
_LIT3: .word 0x0400006c
_LIT4: .word 0x0400106c
_LIT5: .word data_ov004_02211230
_LIT6: .word data_ov004_0220b2a0
_LIT7: .word data_02103fcc
_LIT8: .word 0x38e38e39
_LIT9: .word func_020125e8
_LIT10: .word data_ov000_021b3ed8
_LIT11: .word data_ov000_021b3f48
_LIT12: .word data_02104c18
_LIT13: .word data_ov000_021b333c
