; func_ov004_021d5cdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104dcc
        .extern data_02104e6c
        .extern data_ov004_0220b2a0
        .extern data_ov004_0220efc8
        .extern data_ov004_0221133c
        .extern data_ov004_02291340
        .extern data_ov004_02291388
        .extern func_0200195c
        .extern func_02001d48
        .extern func_020057e4
        .extern func_02005910
        .extern func_02005be0
        .extern func_0200886c
        .extern func_020092c4
        .extern func_02009478
        .extern func_0201cfec
        .extern func_0201d56c
        .extern func_0201e78c
        .extern func_0202ada4
        .extern func_0202c06c
        .extern func_02032638
        .extern func_02033868
        .extern func_0203462c
        .extern func_02034734
        .extern func_02034768
        .extern func_0208c79c
        .extern func_0208c7c8
        .extern func_0208c7e4
        .extern func_0208c858
        .extern func_0208cba8
        .extern func_0208cebc
        .extern func_0208cf48
        .extern func_0208cfd4
        .extern func_0208d050
        .extern func_0208d0fc
        .extern func_0208e230
        .extern func_0208e2f4
        .extern func_02094410
        .extern func_02094500
        .extern func_ov004_021c9cbc
        .extern func_ov004_021ca418
        .extern func_ov004_021cddf0
        .extern func_ov004_021d5bf8
        .extern func_ov004_021d5c98
        .extern func_ov004_021d7824
        .extern func_ov004_021d855c
        .extern func_ov004_021d86ac
        .extern func_ov004_021d8be4
        .extern func_ov004_021d9204
        .global func_ov004_021d5cdc
        .arm
func_ov004_021d5cdc:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r4, _LIT0
    ldr r2, _LIT1
    mov r0, r4
    mov r1, #0x0
    bl func_02094500
    mov r3, #0x10
    mov r2, r4
    mov r0, #0x1
    str r0, [r2, #0x40]
    ldr r0, _LIT2
    rsb r1, r3, #0x0
    str r3, [r2, #0x5c]
    bl func_0208c79c
    mov r1, r4
    ldr r1, [r1, #0x5c]
    ldr r0, _LIT3
    rsb r1, r1, #0x0
    bl func_0208c79c
    mov r0, #0x0
    str r0, [sp]
    ldr r0, _LIT4
    mov r1, #0x1
    mov r2, #0x3f
    mov r3, #0x10
    bl func_0208e230
    ldr r0, _LIT5
    mov r2, #0x0
    ldr r1, _LIT6
    strh r2, [r0]
    ldrh r0, [r1]
    orr r0, r0, #0x8000
    strh r0, [r1]
    bl func_02005910
    ldr r0, _LIT7
    bl func_0208d0fc
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094410
    bl func_0208cba8
    mov r0, #0xc0
    mov r1, #0x7000000
    mov r2, #0x400
    bl func_02094410
    ldr r1, _LIT8
    mov r0, #0xc0
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094410
    ldr r1, _LIT9
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094410
    mov r1, #0x4000000
    ldr r0, [r1]
    add ip, r1, #0x1000
    bic r0, r0, #0x1f00
    str r0, [r1]
    ldr r0, [ip]
    bic r0, r0, #0x1f00
    str r0, [ip]
    ldr r0, [r1]
    bic r0, r0, #0xe000
    str r0, [r1]
    ldr r0, [ip]
    mov r1, #0x0
    bic r3, r0, #0xe000
    mov r2, r1
    mov r0, #0x1
    str r3, [ip]
    bl func_0208c7e4
    ldr r1, _LIT10
    mov r0, #0x4
    mov r2, #0x80000
    bl func_0200195c
    ldr r0, _LIT11
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r0, _LIT12
    bl func_0202ada4
    bl func_ov004_021ca418
    mov r0, #0x4
    bl func_0208d050
    mov r0, #0x8
    bl func_0208cfd4
    mov r0, #0x80
    bl func_0208cf48
    mov r0, #0x100
    bl func_0208cebc
    mov r0, #0x0
    bl func_0208c7c8
    ldr r3, _LIT13
    ldr r1, _LIT14
    ldr r2, [r3]
    mov r0, #0x9
    and r1, r2, r1
    orr r1, r1, #0x10
    orr r1, r1, #0x200000
    str r1, [r3]
    mov r1, #0x2
    bl func_0201d56c
    ldr r2, _LIT13
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x10
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    bl func_0208c858
    ldr r1, _LIT13
    ldr r0, [r1]
    orr r0, r0, #0x10000
    str r0, [r1]
    bl func_0201e78c
    mov r0, #0x1
    bl func_02005be0
    mov r0, #0x2
    bl func_02005be0
    ldr r0, _LIT15
    bl func_020092c4
    ldr r0, _LIT16
    bl func_020057e4
    ldr r0, _LIT17
    bl func_ov004_021d855c
    bl func_0203462c
    bl func_ov004_021d5bf8
    mov r1, #0x1
    mov r0, r4
    str r1, [r0, #0x4c]
    str r1, [r0, #0x48]
    bl func_ov004_021d7824
    mov r1, #0x1c
    ldr r0, _LIT5
    sub r2, r1, #0x2c
    bl func_0208e2f4
    ldr r0, _LIT3
    mov r1, #0x0
    bl func_0208c79c
    bl func_0201cfec
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_3d0
    b .L_278
    b .L_288
    b .L_288
    b .L_3ac
    b .L_3d0
    b .L_3d0
    b .L_3ac
.L_278:
    ldr r0, _LIT18
    mvn r1, #0x0
    str r1, [r0, #0xbac]
    b .L_3d0
.L_288:
    mov r0, #0xe8
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT17
    mov r2, #0x1
    bl func_ov004_021d86ac
    ldr r0, _LIT18
    ldr r2, [r0, #0xbac]
    cmp r2, #0x0
    blt .L_338
    ldr r0, [r0, #0xb9c]
    cmp r0, #0x1
    beq .L_2d0
    cmp r0, #0x2
    beq .L_2f0
    cmp r0, #0x3
    beq .L_310
    b .L_32c
.L_2d0:
    mov r0, #0x54
    mul r1, r2, r0
    add r0, r4, #0x178
    add r2, r0, #0x3c00
    ldrb r0, [r2, r1]
    add r0, r0, #0x1
    strb r0, [r2, r1]
    b .L_32c
.L_2f0:
    mov r0, #0x54
    mul r1, r2, r0
    add r0, r4, #0x79
    add r2, r0, #0x3d00
    ldrb r0, [r2, r1]
    add r0, r0, #0x1
    strb r0, [r2, r1]
    b .L_32c
.L_310:
    mov r0, #0x54
    mul r1, r2, r0
    add r0, r4, #0x7a
    add r2, r0, #0x3d00
    ldrb r0, [r2, r1]
    add r0, r0, #0x1
    strb r0, [r2, r1]
.L_32c:
    add r0, r4, #0x128
    add r0, r0, #0x3c00
    bl func_02009478
.L_338:
    bl func_02034734
    cmp r0, #0x2
    bne .L_39c
    ldr r0, _LIT18
    ldr r0, [r0, #0xbac]
    cmp r0, #0x0
    bge .L_39c
    ldr r0, _LIT19
    ldr r1, _LIT11
    ldrh r3, [r0, #0x68]
    ldr ip, [r1, #0xa5c]
    mov r2, #0x0
    add r3, ip, r3
    str r3, [r1, #0xa5c]
    ldrh r3, [r0, #0x6a]
    ldr ip, [r1, #0xa54]
    add r3, ip, r3
    str r3, [r1, #0xa54]
    ldrh r3, [r0, #0x6c]
    ldr ip, [r1, #0xa60]
    add r3, ip, r3
    str r3, [r1, #0xa60]
    strh r2, [r0, #0x68]
    strh r2, [r0, #0x6a]
    strh r2, [r0, #0x6c]
.L_39c:
    bl func_0200886c
    ldr r0, _LIT17
    bl func_ov004_021d8be4
    b .L_3d0
.L_3ac:
    mov r0, #0xe8
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT17
    mov r2, #0x1
    bl func_ov004_021d86ac
    bl func_0200886c
    ldr r0, _LIT17
    bl func_ov004_021d8be4
.L_3d0:
    ldr r1, [r4, #0x5c]
    ldr r0, _LIT3
    rsb r1, r1, #0x0
    bl func_0208c79c
    ldr r0, _LIT5
    mov r1, #0x0
    strh r1, [r0]
    bl func_02034768
    cmp r0, #0x0
    beq .L_458
    ldr r0, _LIT18
    ldr r0, [r0, #0xbac]
    cmp r0, #0x0
    blt .L_42c
    mov r0, #0x2
    str r0, [r4, #0x4c]
    str r0, [r4, #0x48]
    bl func_ov004_021d9204
    bl func_ov004_021c9cbc
    cmp r0, #0x0
    movne r0, #0x2
    strne r0, [r4, #0x54]
    b .L_490
.L_42c:
    bl func_ov004_021c9cbc
    cmp r0, #0x0
    beq .L_44c
    mov r1, #0x1
    mov r0, #0x0
    str r1, [r4, #0x54]
    bl func_ov004_021cddf0
    b .L_490
.L_44c:
    bl func_02032638
    bl func_02033868
    b .L_490
.L_458:
    ldr r0, _LIT18
    ldr r0, [r0, #0xb9c]
    cmp r0, #0x0
    bne .L_490
    bl func_0201cfec
    cmp r0, #0x1
    cmpne r0, #0x2
    bne .L_490
    ldr r0, _LIT20
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT17
    mov r2, #0x12
    bl func_ov004_021d86ac
.L_490:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word 0x0000609c
_LIT2: .word 0x0400006c
_LIT3: .word 0x0400106c
_LIT4: .word 0x04000050
_LIT5: .word 0x04001050
_LIT6: .word 0x04000304
_LIT7: .word 0x000001ff
_LIT8: .word 0x07000400
_LIT9: .word 0x05000400
_LIT10: .word data_ov004_0221133c
_LIT11: .word data_02104e6c
_LIT12: .word data_ov004_02291340
_LIT13: .word 0x04001000
_LIT14: .word 0xffcfffef
_LIT15: .word data_ov004_0220efc8
_LIT16: .word func_ov004_021d5c98
_LIT17: .word data_ov004_02291388
_LIT18: .word data_02103fcc
_LIT19: .word data_02104dcc
_LIT20: .word 0x00000674
