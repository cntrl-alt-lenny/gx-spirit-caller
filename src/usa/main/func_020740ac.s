; func_020740ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101dc0
        .extern data_0219ede4
        .extern data_0219ede8
        .extern data_0219edf4
        .extern data_0219edfc
        .extern data_0219ee00
        .extern data_0219ee04
        .extern data_0219ee10
        .extern data_0219ee14
        .extern data_0219ee1c
        .extern data_0219ee20
        .extern data_0219ee2c
        .extern data_0219ee34
        .extern data_0219ee44
        .extern data_0219ee48
        .extern data_0219ee4c
        .extern data_0219ee5c
        .extern data_0219efd8
        .extern data_0219f098
        .extern data_0219fe20
        .extern data_021a0620
        .extern func_02000b60
        .extern func_0206fd98
        .extern func_02071054
        .extern func_02074368
        .extern func_02074370
        .extern func_020918f0
        .extern func_02091c3c
        .extern func_02092fc8
        .extern func_02093a20
        .global func_020740ac
        .arm
func_020740ac:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, _LIT0
    bl func_02000b60
    ldr ip, [r4, #0x14]
    ldr r6, [r4, #0x18]
    mov r1, #0x0
    cmp r6, r1
    cmpeq ip, r1
    beq .L_58
    ldr r0, _LIT1
    ldr r5, _LIT2
    ldr r3, _LIT3
    ldr r2, _LIT4
    str ip, [r0]
    str r6, [r0, #0x4]
    str r5, [r0, #0x8]
    str r3, [r0, #0xc]
    str r2, [r0, #0x10]
    str r1, [r0, #0x14]
    b .L_88
.L_58:
    bl func_02092fc8
    ldr r2, _LIT1
    ldr ip, _LIT2
    ldr r6, _LIT3
    ldr r5, _LIT4
    mov r3, #0x0
    str r0, [r2]
    str r1, [r2, #0x4]
    str ip, [r2, #0x8]
    str r6, [r2, #0xc]
    str r5, [r2, #0x10]
    str r3, [r2, #0x14]
.L_88:
    ldr r2, [r4, #0x4]
    cmp r2, #0x0
    beq .L_b8
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_b8
    ldr r1, _LIT5
    ldr r0, _LIT6
    str r2, [r1]
    ldr r1, [r4, #0x8]
    str r1, [r0]
    b .L_cc
.L_b8:
    ldr r2, _LIT7
    ldr r1, _LIT5
    ldr r0, _LIT6
    str r2, [r1]
    str r2, [r0]
.L_cc:
    ldr r1, [r4]
    ldr r0, _LIT8
    ldr ip, _LIT1
    str r1, [r0]
    ldr r1, [r4, #0x24]
    ldr r3, [ip, #0x8]
    cmp r1, #0x0
    ldrne r0, _LIT9
    strneh r1, [r0]
    ldreq r1, _LIT10
    ldreq r0, _LIT9
    streqh r1, [r0]
    ldr r2, [r4, #0x28]
    ldr r1, _LIT11
    ldr r0, _LIT12
    str r2, [r1]
    ldr r1, [r4, #0x2c]
    ldr r2, [ip]
    str r1, [r0]
    ldr r1, [r4, #0xc]
    umull lr, r5, r3, r2
    cmp r1, #0x0
    ldrne r0, _LIT13
    strne r1, [r0]
    ldreq r1, _LIT7
    ldreq r0, _LIT13
    streq r1, [r0]
    ldr r1, [r4, #0x10]
    cmp r1, #0x0
    ldrne r0, _LIT14
    strne r1, [r0]
    ldreq r1, _LIT15
    ldreq r0, _LIT14
    streq r1, [r0]
    ldr r1, [ip, #0x4]
    ldr r0, _LIT16
    mla r5, r3, r1, r5
    ldr r1, [ip, #0xc]
    ldr r3, [ip, #0x10]
    mla r5, r1, r2, r5
    adds r2, r3, lr
    ldr r1, [ip, #0x14]
    mov r3, #0x0
    adc r1, r1, r5
    umull lr, r5, r1, r0
    mla r5, r1, r3, r5
    mla r5, r3, r0, r5
    ldr r6, [r4, #0x1c]
    ldr r0, _LIT17
    ldr lr, _LIT18
    str r6, [r0]
    ldr r4, [r4, #0x20]
    ldr r0, _LIT19
    str r4, [lr]
    str r3, [r0]
    ldr lr, _LIT20
    ldr r4, _LIT21
    add r5, r5, #0x400
    ldr r0, _LIT22
    str r3, [lr]
    str r2, [ip]
    str r1, [ip, #0x4]
    strh r5, [r4]
    bl func_02093a20
    ldr r0, _LIT23
    mov r2, #0x0
    strb r2, [r0]
    mov r1, #0x800
    str r1, [sp]
    ldr r0, _LIT24
    ldr r1, _LIT25
    ldr r4, [r0]
    ldr r0, _LIT26
    ldr r3, _LIT27
    str r4, [sp, #0x4]
    bl func_02091c3c
    mov r1, #0x800
    ldr r0, _LIT24
    str r1, [sp]
    ldr r1, [r0]
    ldr r0, _LIT28
    str r1, [sp, #0x4]
    ldr r1, _LIT29
    ldr r3, _LIT30
    mov r2, #0x0
    bl func_02091c3c
    ldr r0, _LIT26
    bl func_020918f0
    ldr r0, _LIT28
    bl func_020918f0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word 0x02000bec
_LIT1: .word data_0219ee5c
_LIT2: .word 0x6c078965
_LIT3: .word 0x5d588b65
_LIT4: .word 0x00269ec3
_LIT5: .word data_0219ee00
_LIT6: .word data_0219ee2c
_LIT7: .word func_02074370
_LIT8: .word data_0219edfc
_LIT9: .word data_0219ede8
_LIT10: .word 0x000005b4
_LIT11: .word data_0219ee20
_LIT12: .word data_0219ee10
_LIT13: .word data_0219ee04
_LIT14: .word data_0219ee34
_LIT15: .word func_02074368
_LIT16: .word 0x00000f88
_LIT17: .word data_0219ee44
_LIT18: .word data_0219ee48
_LIT19: .word data_0219ee1c
_LIT20: .word data_0219ee14
_LIT21: .word data_0219edf4
_LIT22: .word data_0219ee4c
_LIT23: .word data_0219ede4
_LIT24: .word data_02101dc0
_LIT25: .word func_02071054
_LIT26: .word data_0219f098
_LIT27: .word data_021a0620
_LIT28: .word data_0219efd8
_LIT29: .word func_0206fd98
_LIT30: .word data_0219fe20
