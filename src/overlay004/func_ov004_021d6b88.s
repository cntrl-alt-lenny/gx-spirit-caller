; func_ov004_021d6b88 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104cae
        .extern data_02104cb0
        .extern data_02104eac
        .extern data_02104f4c
        .extern data_ov000_021b22c8
        .extern data_ov000_021b2314
        .extern data_ov004_0220a0bc
        .extern data_ov004_0220b500
        .extern data_ov004_0220e500
        .extern data_ov004_022915e8
        .extern func_02000ef8
        .extern func_020057dc
        .extern func_02005800
        .extern func_02006918
        .extern func_020071a4
        .extern func_02008888
        .extern func_02009494
        .extern func_0201261c
        .extern func_0201d040
        .extern func_0201d050
        .extern func_0202c0c0
        .extern func_0208c884
        .extern func_0208e2f4
        .extern func_02094504
        .extern func_ov004_021d641c
        .extern func_ov004_021d6468
        .extern func_ov004_021d8798
        .extern func_ov004_021d8cd0
        .extern func_ov004_021d8d1c
        .global func_ov004_021d6b88
        .arm
func_ov004_021d6b88:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r4, _LIT1
    bl func_0208c884
    ldr r0, _LIT2
    mov r1, #0x0
    bl func_0208c884
    mov r1, #0x3f
    ldr r0, _LIT3
    sub r2, r1, #0x4f
    bl func_0208e2f4
    mov r1, #0x3f
    ldr r0, _LIT4
    sub r2, r1, #0x4f
    bl func_0208e2f4
    ldr r0, _LIT5
    ldr r0, [r0, #0xcd0]
    cmp r0, #0x0
    bne .L_4b8
    ldr r0, [r4, #0x48]
    cmp r0, #0x5
    ldreq r0, [r4, #0x50]
    cmpeq r0, #0x1
    bne .L_5e0
.L_4b8:
    ldr ip, _LIT6
    mov r1, #0x1c
    ldr r2, [ip]
    ldr r0, [ip]
    and r2, r2, #0x1f00
    mov r3, r2, lsr #0x8
    bic r2, r0, #0x1f00
    bic r0, r3, #0x14
    orr r3, r2, r0, lsl #0x8
    add r0, ip, #0x50
    sub r2, r1, #0x2c
    str r3, [ip]
    bl func_0208e2f4
    mov r0, #0xe8
    bl func_0202c0c0
    mov r1, r0
    ldr r0, _LIT7
    mov r2, #0x1
    bl func_ov004_021d8798
    ldr r0, [r4, #0x48]
    cmp r0, #0x5
    ldreq r0, [r4, #0x50]
    cmpeq r0, #0x1
    bne .L_598
    ldr r0, _LIT8
    ldr r1, _LIT9
    ldr r2, [r0, #0xa5c]
    ldr r0, _LIT8
    cmp r2, #0x64
    movcs r2, #0x64
    strh r2, [r1, #0x68]
    ldr r2, [r0, #0xa54]
    ldr r1, _LIT9
    cmp r2, #0x64
    movcs r2, #0x64
    strh r2, [r1, #0x6a]
    ldr r0, _LIT8
    ldr r1, _LIT9
    ldr r2, [r0, #0xa60]
    ldr r0, _LIT8
    cmp r2, #0x64
    movcs r2, #0x64
    strh r2, [r1, #0x6c]
    ldrh r2, [r1, #0x68]
    ldr r3, [r0, #0xa5c]
    sub r2, r3, r2
    str r2, [r0, #0xa5c]
    ldrh r2, [r1, #0x6a]
    ldr r3, [r0, #0xa54]
    sub r2, r3, r2
    str r2, [r0, #0xa54]
    ldrh r1, [r1, #0x6c]
    ldr r2, [r0, #0xa60]
    sub r1, r2, r1
    str r1, [r0, #0xa60]
    bl func_02008888
.L_598:
    add r0, r4, #0x3000
    ldr r0, [r0, #0xcd0]
    cmp r0, #0x0
    beq .L_5c8
    mov r0, #0x0
    bl func_ov004_021d6468
    add r0, r4, #0x128
    add r0, r0, #0x3c00
    bl func_02009494
    add r0, r4, #0x3000
    mov r1, #0x0
    str r1, [r0, #0xcd0]
.L_5c8:
    ldr r0, _LIT7
    bl func_ov004_021d8cd0
    mov r1, #0x3f
    ldr r0, _LIT4
    sub r2, r1, #0x4f
    bl func_0208e2f4
.L_5e0:
    mov r0, #0x0
    bl func_02005800
    ldr r0, _LIT7
    bl func_ov004_021d8d1c
    bl func_02006918
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094504
    ldr r1, _LIT10
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    ldr r0, _LIT11
    mvn r1, #0x0
    str r1, [r0, #0xbac]
    ldr r0, [r4, #0x48]
    cmp r0, #0x5
    beq .L_640
    cmp r0, #0x9
    beq .L_6f4
    cmp r0, #0xa
    beq .L_714
    b .L_734
.L_640:
    add r0, r4, #0xd4
    add r0, r0, #0x3c00
    bl func_ov004_021d641c
    ldr r3, _LIT11
    ldr r1, _LIT12
    str r0, [r3, #0xbac]
    ldr ip, [r3, #0xc38]
    mov r2, #0x12
    umull r0, r1, ip, r1
    mov r1, r1, lsr #0x2
    umull r0, r1, r2, r1
    sub r1, ip, r0
    str r1, [r3, #0xb84]
    bl func_0201d040
    cmp r0, #0x2
    moveq r1, #0x1
    ldr r0, _LIT11
    movne r1, #0x0
    mov lr, #0x0
    str r1, [r0, #0xb88]
    str lr, [r0, #0xb9c]
    ldr r1, [r4, #0x50]
    cmp r1, #0x1
    bne .L_6e4
    sub r1, lr, #0x1
    str r1, [r0, #0xbac]
    ldr r0, [r0, #0xc3c]
    ldr r3, _LIT13
    rsb r1, r0, #0x1
    mov r0, #0x1a
    mul r4, r1, r0
    ldr r0, _LIT14
    ldr ip, _LIT15
    ldrb r2, [r3]
    strb lr, [r0, r1]
    ldrb r1, [r3, #0x1]
    ldrb r0, [r3, #0x2]
    strb r2, [ip, r4]
    add r2, ip, r4
    strb r1, [r2, #0x1]
    strb r0, [r2, #0x2]
.L_6e4:
    ldr r0, _LIT16
    bl func_020057dc
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_6f4:
    ldr r2, _LIT17
    mov r0, #0x5
    mov r1, #0x6
    bl func_020071a4
    mov r0, #0x3
    bl func_0201d050
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_714:
    ldr r2, _LIT18
    mov r0, #0x5
    mov r1, #0x17
    bl func_020071a4
    mov r0, #0x6
    bl func_0201d050
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_734:
    mov r0, #0x0
    bl func_0201d050
    bl func_02000ef8
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0400006c
_LIT1: .word data_ov004_0220b500
_LIT2: .word 0x0400106c
_LIT3: .word 0x04000050
_LIT4: .word 0x04001050
_LIT5: .word data_ov004_0220e500
_LIT6: .word 0x04001000
_LIT7: .word data_ov004_022915e8
_LIT8: .word data_02104f4c
_LIT9: .word data_02104eac
_LIT10: .word 0x05000400
_LIT11: .word data_021040ac
_LIT12: .word 0x38e38e39
_LIT13: .word data_ov004_0220a0bc
_LIT14: .word data_02104cae
_LIT15: .word data_02104cb0
_LIT16: .word func_0201261c
_LIT17: .word data_ov000_021b22c8
_LIT18: .word data_ov000_021b2314
