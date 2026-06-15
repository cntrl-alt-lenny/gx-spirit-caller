; func_ov004_021d5dc8 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104eac
        .extern data_02104f4c
        .extern data_ov004_0220b500
        .extern data_ov004_0220f228
        .extern data_ov004_0221159c
        .extern data_ov004_022915a0
        .extern data_ov004_022915e8
        .extern func_0200197c
        .extern func_02001d68
        .extern func_02005800
        .extern func_0200592c
        .extern func_02005bfc
        .extern func_02008888
        .extern func_020092e0
        .extern func_02009494
        .extern func_0201d040
        .extern func_0201d5c0
        .extern func_0201e7e0
        .extern func_0202adf8
        .extern func_0202c0c0
        .extern func_0203268c
        .extern func_020338b8
        .extern func_0203467c
        .extern func_02034784
        .extern func_020347b8
        .extern func_0208c884
        .extern func_0208c8b0
        .extern func_0208c8cc
        .extern func_0208c940
        .extern func_0208cc90
        .extern func_0208cfa4
        .extern func_0208d030
        .extern func_0208d0bc
        .extern func_0208d138
        .extern func_0208d1e4
        .extern func_0208e2f4
        .extern func_0208e318
        .extern func_02094504
        .extern func_020945f4
        .extern func_ov004_021c9d9c
        .extern func_ov004_021ca4f8
        .extern func_ov004_021cded0
        .extern func_ov004_021d5ce4
        .extern func_ov004_021d5d84
        .extern func_ov004_021d7910
        .extern func_ov004_021d8648
        .extern func_ov004_021d8798
        .extern func_ov004_021d8cd0
        .extern func_ov004_021d9418
        .global func_ov004_021d5dc8
        .arm
func_ov004_021d5dc8:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r4, _LIT0
    ldr r2, _LIT1
    mov r0, r4
    mov r1, #0x0
    bl func_020945f4
    mov r3, #0x10
    mov r2, r4
    mov r0, #0x1
    str r0, [r2, #0x40]
    ldr r0, _LIT2
    rsb r1, r3, #0x0
    str r3, [r2, #0x5c]
    bl func_0208c884
    mov r1, r4
    ldr r1, [r1, #0x5c]
    ldr r0, _LIT3
    rsb r1, r1, #0x0
    bl func_0208c884
    mov r0, #0x0
    str r0, [sp]
    ldr r0, _LIT4
    mov r1, #0x1
    mov r2, #0x3f
    mov r3, #0x10
    bl func_0208e318
    ldr r0, _LIT5
    mov r2, #0x0
    ldr r1, _LIT6
    strh r2, [r0]
    ldrh r0, [r1]
    orr r0, r0, #0x8000
    strh r0, [r1]
    bl func_0200592c
    ldr r0, _LIT7
    bl func_0208d1e4
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094504
    bl func_0208cc90
    mov r0, #0xc0
    mov r1, #0x7000000
    mov r2, #0x400
    bl func_02094504
    ldr r1, _LIT8
    mov r0, #0xc0
    mov r2, #0x400
    bl func_02094504
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094504
    ldr r1, _LIT9
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
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
    bl func_0208c8cc
    ldr r1, _LIT10
    mov r0, #0x4
    mov r2, #0x80000
    bl func_0200197c
    ldr r0, _LIT11
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, _LIT12
    bl func_0202adf8
    bl func_ov004_021ca4f8
    mov r0, #0x4
    bl func_0208d138
    mov r0, #0x8
    bl func_0208d0bc
    mov r0, #0x80
    bl func_0208d030
    mov r0, #0x100
    bl func_0208cfa4
    mov r0, #0x0
    bl func_0208c8b0
    ldr r3, _LIT13
    ldr r1, _LIT14
    ldr r2, [r3]
    mov r0, #0x9
    and r1, r2, r1
    orr r1, r1, #0x10
    orr r1, r1, #0x200000
    str r1, [r3]
    mov r1, #0x2
    bl func_0201d5c0
    ldr r2, _LIT13
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x10
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    bl func_0208c940
    ldr r1, _LIT13
    ldr r0, [r1]
    orr r0, r0, #0x10000
    str r0, [r1]
    bl func_0201e7e0
    mov r0, #0x1
    bl func_02005bfc
    mov r0, #0x2
    bl func_02005bfc
    ldr r0, _LIT15
    bl func_020092e0
    ldr r0, _LIT16
    bl func_02005800
    ldr r0, _LIT17
    bl func_ov004_021d8648
    bl func_0203467c
    bl func_ov004_021d5ce4
    mov r1, #0x1
    mov r0, r4
    str r1, [r0, #0x4c]
    str r1, [r0, #0x48]
    bl func_ov004_021d7910
    mov r1, #0x1c
    ldr r0, _LIT5
    sub r2, r1, #0x2c
    bl func_0208e2f4
    ldr r0, _LIT3
    mov r1, #0x0
    bl func_0208c884
    bl func_0201d040
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
    bl func_0202c0c0
    mov r1, r0
    ldr r0, _LIT17
    mov r2, #0x1
    bl func_ov004_021d8798
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
    bl func_02009494
.L_338:
    bl func_02034784
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
    bl func_02008888
    ldr r0, _LIT17
    bl func_ov004_021d8cd0
    b .L_3d0
.L_3ac:
    mov r0, #0xe8
    bl func_0202c0c0
    mov r1, r0
    ldr r0, _LIT17
    mov r2, #0x1
    bl func_ov004_021d8798
    bl func_02008888
    ldr r0, _LIT17
    bl func_ov004_021d8cd0
.L_3d0:
    ldr r1, [r4, #0x5c]
    ldr r0, _LIT3
    rsb r1, r1, #0x0
    bl func_0208c884
    ldr r0, _LIT5
    mov r1, #0x0
    strh r1, [r0]
    bl func_020347b8
    cmp r0, #0x0
    beq .L_458
    ldr r0, _LIT18
    ldr r0, [r0, #0xbac]
    cmp r0, #0x0
    blt .L_42c
    mov r0, #0x2
    str r0, [r4, #0x4c]
    str r0, [r4, #0x48]
    bl func_ov004_021d9418
    bl func_ov004_021c9d9c
    cmp r0, #0x0
    movne r0, #0x2
    strne r0, [r4, #0x54]
    b .L_490
.L_42c:
    bl func_ov004_021c9d9c
    cmp r0, #0x0
    beq .L_44c
    mov r1, #0x1
    mov r0, #0x0
    str r1, [r4, #0x54]
    bl func_ov004_021cded0
    b .L_490
.L_44c:
    bl func_0203268c
    bl func_020338b8
    b .L_490
.L_458:
    ldr r0, _LIT18
    ldr r0, [r0, #0xb9c]
    cmp r0, #0x0
    bne .L_490
    bl func_0201d040
    cmp r0, #0x1
    cmpne r0, #0x2
    bne .L_490
    ldr r0, _LIT20
    bl func_0202c0c0
    mov r1, r0
    ldr r0, _LIT17
    mov r2, #0x12
    bl func_ov004_021d8798
.L_490:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word 0x0000609c
_LIT2: .word 0x0400006c
_LIT3: .word 0x0400106c
_LIT4: .word 0x04000050
_LIT5: .word 0x04001050
_LIT6: .word 0x04000304
_LIT7: .word 0x000001ff
_LIT8: .word 0x07000400
_LIT9: .word 0x05000400
_LIT10: .word data_ov004_0221159c
_LIT11: .word data_02104f4c
_LIT12: .word data_ov004_022915a0
_LIT13: .word 0x04001000
_LIT14: .word 0xffcfffef
_LIT15: .word data_ov004_0220f228
_LIT16: .word func_ov004_021d5d84
_LIT17: .word data_ov004_022915e8
_LIT18: .word data_021040ac
_LIT19: .word data_02104eac
_LIT20: .word 0x00000674
