; func_ov002_021aeb24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ca780
        .extern data_ov002_022ca788
        .extern data_ov002_022ca794
        .extern data_ov002_022ca7a0
        .extern data_ov002_022ca7a4
        .extern data_ov002_022ca7ac
        .extern data_ov002_022ca7b4
        .extern data_ov002_022ca7b8
        .extern data_ov002_022ca7c0
        .extern data_ov002_022ca7c8
        .extern data_ov002_022ca7d0
        .extern data_ov002_022ca7dc
        .extern data_ov002_022ca7e8
        .extern data_ov002_022ca7f4
        .extern data_ov002_022ca800
        .extern data_ov002_022ca80c
        .extern data_ov002_022ca818
        .extern data_ov002_022ca820
        .extern data_ov002_022ca82c
        .extern data_ov002_022ca83c
        .extern data_ov002_022ca848
        .extern data_ov002_022ca850
        .extern data_ov002_022ca85c
        .extern data_ov002_022ca868
        .extern data_ov002_022ca874
        .extern data_ov002_022ca87c
        .extern data_ov002_022cd65c
        .extern data_ov002_022cdb98
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf09c
        .extern data_ov002_022cf0a0
        .extern data_ov002_022cf0a4
        .extern data_ov002_022cf0a8
        .extern data_ov002_022cf2ec
        .extern data_ov002_022cf42c
        .extern data_ov002_022cf4a4
        .extern data_ov002_022cf65c
        .extern data_ov002_022d008c
        .extern data_ov002_022d0570
        .extern func_020aab90
        .extern func_020aaf60
        .extern func_ov002_021aea7c
        .global func_ov002_021aeb24
        .arm
func_ov002_021aeb24:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x58
    mov r6, r0
    ldrsb r1, [r6]
    cmp r1, #0x50
    bgt .L_3c
    bge .L_9c
    cmp r1, #0x45
    bgt .L_8ec
    cmp r1, #0x43
    blt .L_8ec
    beq .L_1dc
    cmp r1, #0x45
    beq .L_5a8
    b .L_8ec
.L_3c:
    cmp r1, #0x54
    bgt .L_4c
    beq .L_74
    b .L_8ec
.L_4c:
    cmp r1, #0x5b
    bne .L_8ec
    ldr r1, _LIT0
    mov r2, #0x5
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_8ec
    add sp, sp, #0x58
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_74:
    ldr r1, _LIT1
    mov r2, #0xa
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_8ec
    ldrsb r1, [r6, #0xb]
    ldr r0, _LIT2
    sub r1, r1, #0x30
    str r1, [r0, #0x10]
    b .L_8ec
.L_9c:
    ldr r1, _LIT3
    mov r2, #0x8
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_e4
    ldrsb r3, [r6, #0x8]
    ldr r1, _LIT4
    add r2, sp, #0x54
    add r0, r6, #0xa
    sub r4, r3, #0x30
    bl func_020aab90
    ldr r0, _LIT5
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r1, [sp, #0x54]
    ldr r0, _LIT6
    str r1, [r0, r2]
    b .L_8ec
.L_e4:
    ldr r1, _LIT7
    mov r0, r6
    mov r2, #0x5
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_8ec
    ldrsb r0, [r6, #0x6]
    cmp r0, #0x4d
    bgt .L_134
    bge .L_178
    cmp r0, #0x45
    bgt .L_8ec
    cmp r0, #0x42
    blt .L_8ec
    beq .L_198
    cmp r0, #0x44
    beq .L_140
    cmp r0, #0x45
    beq .L_1bc
    b .L_8ec
.L_134:
    cmp r0, #0x53
    beq .L_15c
    b .L_8ec
.L_140:
    ldr r0, _LIT8
    mov r1, #0x0
    str r1, [r0, #0xcf8]
    mov r1, #0x1
    str r1, [r0, #0xd1c]
    str r1, [r0, #0xd20]
    b .L_8ec
.L_15c:
    ldr r0, _LIT8
    mov r2, #0x1
    str r2, [r0, #0xcf8]
    mov r1, #0x2
    str r1, [r0, #0xd1c]
    str r2, [r0, #0xd20]
    b .L_8ec
.L_178:
    ldr r0, _LIT8
    mov r1, #0x2
    str r1, [r0, #0xcf8]
    mov r1, #0x3
    str r1, [r0, #0xd1c]
    mov r1, #0x1
    str r1, [r0, #0xd20]
    b .L_8ec
.L_198:
    ldr r0, _LIT8
    mov r1, #0x3
    str r1, [r0, #0xcf8]
    str r1, [r0, #0xd1c]
    mov r1, #0x16
    str r1, [r0, #0xd20]
    mov r1, #0x1
    str r1, [r0, #0xd2c]
    b .L_8ec
.L_1bc:
    ldr r0, _LIT8
    mov r1, #0x5
    str r1, [r0, #0xcf8]
    mov r1, #0x4
    str r1, [r0, #0xd1c]
    mov r1, #0x1
    str r1, [r0, #0xd20]
    b .L_8ec
.L_1dc:
    ldr r1, _LIT9
    mov r2, #0x6
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_8ec
    ldrsb r0, [r6, #0x6]
    sub r0, r0, #0x44
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_8ec
    b .L_28c
    b .L_354
    b .L_2f0
    b .L_3b8
    b .L_218
.L_218:
    ldrsb r1, [r6, #0xa]
    ldrsb r0, [r6, #0xb]
    sub r4, r1, #0x30
    cmp r0, #0x3d
    beq .L_8ec
    ldr r1, _LIT4
    add r2, sp, #0x50
    add r0, r6, #0x10
    bl func_020aab90
    ldr r0, _LIT5
    and r1, r4, #0x1
    mul r5, r1, r0
    mov r0, r4
    ldr r1, [sp, #0x50]
    ldr r4, _LIT10
    bl func_ov002_021aea7c
    ldr r1, _LIT11
    ldr r2, [r4, r5]
    add r1, r1, r5
    str r0, [r1, r2, lsl #0x2]
    ldr r1, [r4, r5]
    ldr r2, _LIT12
    add r1, r1, #0x1
    str r1, [r4, r5]
    ldr r1, [r2, r5]
    str r0, [sp, #0x10]
    add r0, r1, #0x1
    str r0, [r2, r5]
    b .L_8ec
.L_28c:
    ldrsb r1, [r6, #0xa]
    ldrsb r0, [r6, #0xb]
    sub r5, r1, #0x30
    cmp r0, #0x3d
    beq .L_8ec
    ldr r1, _LIT4
    add r2, sp, #0x4c
    add r0, r6, #0x10
    bl func_020aab90
    ldr r0, _LIT5
    and r1, r5, #0x1
    mul r4, r1, r0
    mov r0, r5
    ldr r1, [sp, #0x4c]
    ldr r5, _LIT10
    bl func_ov002_021aea7c
    ldr r1, _LIT11
    ldr r2, [r5, r4]
    add r1, r1, r4
    str r0, [r1, r2, lsl #0x2]
    ldr r1, [r5, r4]
    str r0, [sp, #0xc]
    add r0, r1, #0x1
    str r0, [r5, r4]
    b .L_8ec
.L_2f0:
    ldrsb r1, [r6, #0xc]
    ldrsb r0, [r6, #0xd]
    sub r5, r1, #0x30
    cmp r0, #0x3d
    beq .L_8ec
    ldr r1, _LIT4
    add r2, sp, #0x48
    add r0, r6, #0x12
    bl func_020aab90
    ldr r0, _LIT5
    and r1, r5, #0x1
    mul r4, r1, r0
    mov r0, r5
    ldr r1, [sp, #0x48]
    ldr r5, _LIT13
    bl func_ov002_021aea7c
    ldr r1, _LIT14
    ldr r2, [r5, r4]
    add r1, r1, r4
    str r0, [r1, r2, lsl #0x2]
    ldr r1, [r5, r4]
    str r0, [sp, #0x8]
    add r0, r1, #0x1
    str r0, [r5, r4]
    b .L_8ec
.L_354:
    ldrsb r1, [r6, #0xd]
    ldrsb r0, [r6, #0xe]
    sub r5, r1, #0x30
    cmp r0, #0x3d
    beq .L_8ec
    ldr r1, _LIT4
    add r2, sp, #0x44
    add r0, r6, #0x13
    bl func_020aab90
    ldr r0, _LIT5
    and r1, r5, #0x1
    mul r4, r1, r0
    mov r0, r5
    ldr r1, [sp, #0x44]
    ldr r5, _LIT15
    bl func_ov002_021aea7c
    ldr r1, _LIT16
    ldr r2, [r5, r4]
    add r1, r1, r4
    str r0, [r1, r2, lsl #0x2]
    ldr r1, [r5, r4]
    str r0, [sp, #0x4]
    add r0, r1, #0x1
    str r0, [r5, r4]
    b .L_8ec
.L_3b8:
    ldrsb r0, [r6, #0x7]
    cmp r0, #0x72
    bne .L_428
    ldrsb r1, [r6, #0xb]
    ldrsb r0, [r6, #0xc]
    sub r5, r1, #0x30
    cmp r0, #0x3d
    beq .L_8ec
    ldr r1, _LIT4
    add r2, sp, #0x40
    add r0, r6, #0x11
    bl func_020aab90
    ldr r0, _LIT5
    and r1, r5, #0x1
    mul r4, r1, r0
    mov r0, r5
    ldr r1, [sp, #0x40]
    ldr r5, _LIT17
    bl func_ov002_021aea7c
    ldr r1, _LIT18
    ldr r2, [r5, r4]
    add r1, r1, r4
    str r0, [r1, r2, lsl #0x2]
    ldr r1, [r5, r4]
    str r0, [sp]
    add r0, r1, #0x1
    str r0, [r5, r4]
    b .L_8ec
.L_428:
    ldrsb r3, [r6, #0xa]
    ldr r1, _LIT4
    add r2, sp, #0x3c
    add r0, r6, #0xc
    sub r4, r3, #0x30
    bl func_020aab90
    ldr r1, _LIT19
    add r0, r6, #0xf
    mov r2, #0x1
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_4ac
    ldr r2, _LIT6
    ldr r0, _LIT5
    and r1, r4, #0x1
    mla r3, r1, r0, r2
    ldr r1, [sp, #0x3c]
    mov r0, #0x14
    mul r4, r1, r0
    ldr r1, _LIT4
    add r2, sp, #0x38
    add r5, r3, #0x30
    add r0, r6, #0x10
    bl func_020aab90
    mov r0, #0x2000
    ldr r2, [r5, r4]
    rsb r0, r0, #0x0
    ldr r1, [sp, #0x38]
    and r2, r2, r0
    and r0, r1, r0, lsr #0x13
    orr r0, r2, r0
    str r0, [r5, r4]
    b .L_8ec
.L_4ac:
    ldr r1, _LIT20
    add r0, r6, #0xf
    mov r2, #0x5
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_500
    ldr r2, _LIT6
    ldr r0, _LIT5
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    add r2, r0, #0x30
    ldr r1, [sp, #0x3c]
    mov r0, #0x14
    mla r4, r1, r0, r2
    ldr r1, _LIT4
    add r2, sp, #0x34
    add r0, r6, #0x15
    bl func_020aab90
    ldr r0, [sp, #0x34]
    strh r0, [r4, #0x8]
    b .L_8ec
.L_500:
    ldr r1, _LIT21
    add r0, r6, #0xf
    mov r2, #0x5
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_554
    ldr r2, _LIT6
    ldr r0, _LIT5
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    add r2, r0, #0x30
    ldr r1, [sp, #0x3c]
    mov r0, #0x14
    mla r4, r1, r0, r2
    ldr r1, _LIT4
    add r2, sp, #0x30
    add r0, r6, #0x15
    bl func_020aab90
    ldr r0, [sp, #0x30]
    strh r0, [r4, #0x6]
    b .L_8ec
.L_554:
    ldr r1, _LIT22
    add r0, r6, #0xf
    mov r2, #0x6
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_8ec
    ldr r2, _LIT6
    ldr r0, _LIT5
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    add r2, r0, #0x30
    ldr r1, [sp, #0x3c]
    mov r0, #0x14
    mla r4, r1, r0, r2
    ldr r1, _LIT4
    add r2, sp, #0x2c
    add r0, r6, #0x16
    bl func_020aab90
    ldr r0, [sp, #0x2c]
    str r0, [r4, #0xc]
    b .L_8ec
.L_5a8:
    ldr r1, _LIT23
    mov r2, #0x8
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_8ec
    ldrsb r0, [r6, #0x8]
    cmp r0, #0x3d
    beq .L_8ec
    ldr r1, _LIT4
    add r2, sp, #0x28
    add r0, r6, #0x8
    bl func_020aab90
    ldr r0, _LIT24
    ldr r1, [sp, #0x28]
    ldr r5, [r0, #0xc]
    add r1, r1, #0x1
    ldr r0, _LIT25
    cmp r5, r1
    add r4, r0, r1, lsl #0x3
    movls r5, r1
    ldr r3, _LIT24
    ldr r1, _LIT26
    add r0, r6, #0xc
    mov r2, #0x9
    str r5, [r3, #0xc]
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_648
    ldr r1, _LIT4
    add r2, sp, #0x24
    add r0, r6, #0x16
    bl func_020aab90
    ldrh r0, [r4]
    ldr r1, [sp, #0x24]
    mov r0, r0, asr #0x8
    and r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0, lsl #0x8
    strh r0, [r4]
    b .L_8ec
.L_648:
    ldr r1, _LIT27
    add r0, r6, #0xc
    mov r2, #0x9
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_68c
    ldr r1, _LIT4
    add r2, sp, #0x20
    add r0, r6, #0x16
    bl func_020aab90
    ldrh r1, [r4]
    ldr r0, [sp, #0x20]
    and r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0, lsl #0x8
    strh r0, [r4]
    b .L_8ec
.L_68c:
    ldr r1, _LIT28
    add r0, r6, #0xc
    mov r2, #0x9
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_6c0
    ldr r1, _LIT4
    add r2, sp, #0x1c
    add r0, r6, #0x16
    bl func_020aab90
    ldr r0, [sp, #0x1c]
    strh r0, [r4]
    b .L_8ec
.L_6c0:
    ldr r1, _LIT29
    add r0, r6, #0xc
    mov r2, #0x9
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_708
    ldr r1, _LIT4
    add r2, sp, #0x18
    add r0, r6, #0x16
    bl func_020aab90
    ldrh r0, [r4, #0x4]
    ldr r1, [sp, #0x18]
    mov r0, r0, asr #0x8
    and r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0, lsl #0x8
    strh r0, [r4, #0x4]
    b .L_8ec
.L_708:
    ldr r1, _LIT30
    add r0, r6, #0xc
    mov r2, #0x9
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_74c
    ldr r1, _LIT4
    add r2, sp, #0x14
    add r0, r6, #0x16
    bl func_020aab90
    ldrh r1, [r4, #0x4]
    ldr r0, [sp, #0x14]
    and r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0, lsl #0x8
    strh r0, [r4, #0x4]
    b .L_8ec
.L_74c:
    ldr r1, _LIT31
    add r0, r6, #0xc
    mov r2, #0x4
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_8ec
    ldr r1, _LIT32
    add r0, r6, #0x11
    mov r2, #0xa
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_790
    ldrh r0, [r4, #0x2]
    bic r0, r0, #0xf
    orr r0, r0, #0x1
    strh r0, [r4, #0x2]
    b .L_8ec
.L_790:
    ldr r1, _LIT33
    add r0, r6, #0x11
    mov r2, #0xc
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_7bc
    ldrh r0, [r4, #0x2]
    bic r0, r0, #0xf
    orr r0, r0, #0x2
    strh r0, [r4, #0x2]
    b .L_8ec
.L_7bc:
    ldr r1, _LIT34
    add r0, r6, #0x11
    mov r2, #0x8
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_7e8
    ldrh r0, [r4, #0x2]
    bic r0, r0, #0xf
    orr r0, r0, #0x3
    strh r0, [r4, #0x2]
    b .L_8ec
.L_7e8:
    ldr r1, _LIT35
    add r0, r6, #0x11
    mov r2, #0x7
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_814
    ldrh r0, [r4, #0x2]
    bic r0, r0, #0xf
    orr r0, r0, #0x5
    strh r0, [r4, #0x2]
    b .L_8ec
.L_814:
    ldr r1, _LIT36
    add r0, r6, #0x11
    mov r2, #0x9
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_840
    ldrh r0, [r4, #0x2]
    bic r0, r0, #0xf
    orr r0, r0, #0x6
    strh r0, [r4, #0x2]
    b .L_8ec
.L_840:
    ldr r1, _LIT37
    add r0, r6, #0x11
    mov r2, #0xa
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_86c
    ldrh r0, [r4, #0x2]
    bic r0, r0, #0xf
    orr r0, r0, #0x7
    strh r0, [r4, #0x2]
    b .L_8ec
.L_86c:
    ldr r1, _LIT38
    add r0, r6, #0x11
    mov r2, #0x9
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_898
    ldrh r0, [r4, #0x2]
    bic r0, r0, #0xf
    orr r0, r0, #0xa
    strh r0, [r4, #0x2]
    b .L_8ec
.L_898:
    ldr r1, _LIT39
    add r0, r6, #0x11
    mov r2, #0x5
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_8c4
    ldrh r0, [r4, #0x2]
    bic r0, r0, #0xf
    orr r0, r0, #0xb
    strh r0, [r4, #0x2]
    b .L_8ec
.L_8c4:
    ldr r1, _LIT40
    add r0, r6, #0x11
    mov r2, #0x8
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_8ec
    ldrh r0, [r4, #0x2]
    bic r0, r0, #0xf
    orr r0, r0, #0xd
    strh r0, [r4, #0x2]
.L_8ec:
    mov r0, #0x0
    add sp, sp, #0x58
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ca780
_LIT1: .word data_ov002_022ca788
_LIT2: .word data_ov002_022cd65c
_LIT3: .word data_ov002_022ca794
_LIT4: .word data_ov002_022ca7a0
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022cf08c
_LIT7: .word data_ov002_022ca7a4
_LIT8: .word data_ov002_022d008c
_LIT9: .word data_ov002_022ca7ac
_LIT10: .word data_ov002_022cf09c
_LIT11: .word data_ov002_022cf2ec
_LIT12: .word data_ov002_022cf098
_LIT13: .word data_ov002_022cf0a4
_LIT14: .word data_ov002_022cf42c
_LIT15: .word data_ov002_022cf0a8
_LIT16: .word data_ov002_022cf65c
_LIT17: .word data_ov002_022cf0a0
_LIT18: .word data_ov002_022cf4a4
_LIT19: .word data_ov002_022ca7b4
_LIT20: .word data_ov002_022ca7b8
_LIT21: .word data_ov002_022ca7c0
_LIT22: .word data_ov002_022ca7c8
_LIT23: .word data_ov002_022ca7d0
_LIT24: .word data_ov002_022cdb98
_LIT25: .word data_ov002_022d0570
_LIT26: .word data_ov002_022ca7dc
_LIT27: .word data_ov002_022ca7e8
_LIT28: .word data_ov002_022ca7f4
_LIT29: .word data_ov002_022ca800
_LIT30: .word data_ov002_022ca80c
_LIT31: .word data_ov002_022ca818
_LIT32: .word data_ov002_022ca820
_LIT33: .word data_ov002_022ca82c
_LIT34: .word data_ov002_022ca83c
_LIT35: .word data_ov002_022ca848
_LIT36: .word data_ov002_022ca850
_LIT37: .word data_ov002_022ca85c
_LIT38: .word data_ov002_022ca868
_LIT39: .word data_ov002_022ca874
_LIT40: .word data_ov002_022ca87c
