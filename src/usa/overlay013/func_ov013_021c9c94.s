; func_ov013_021c9c94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern GetSystemWork
        .extern data_02104e3c
        .extern data_02104e6c
        .extern data_ov013_021cbb20
        .extern data_ov013_021cbb5c
        .extern data_ov013_021cbbcc
        .extern func_02005910
        .extern func_02005be0
        .extern func_0201d56c
        .extern func_0202ada4
        .extern func_0202c01c
        .extern func_0207ddc8
        .extern func_0207e03c
        .extern func_0207e288
        .extern func_02082244
        .extern func_0208c7c8
        .extern func_0208c7e4
        .extern func_0208cba8
        .extern func_0208cebc
        .extern func_0208cf48
        .extern func_0208cfd4
        .extern func_0208d050
        .extern func_0208d0fc
        .extern func_0208d60c
        .extern func_0208d6c4
        .extern func_0208d7d8
        .extern func_0208d944
        .extern func_0208e504
        .extern func_0208e6c4
        .extern func_02094410
        .extern func_ov000_021aad74
        .extern func_ov000_021ab13c
        .extern func_ov000_021ab3dc
        .extern func_ov000_021ab60c
        .extern func_ov000_021af3d0
        .global func_ov013_021c9c94
        .arm
func_ov013_021c9c94:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r4, _LIT0
    ldr r2, _LIT1
    mov r1, r4
    mov r0, #0x0
    bl Fill32
    bl func_02005910
    ldr r0, _LIT2
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
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094410
    bl func_ov000_021ab13c
    bl func_0208e6c4
    mov r0, #0x1
    bl func_0208d944
    mov r0, #0x40
    bl func_0208d6c4
    mov r0, #0x2
    bl func_0208d7d8
    mov r0, #0x20
    bl func_0208d60c
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r1
    bl func_0208c7e4
    mov r0, #0x0
    mov r1, #0x12
    bl func_ov000_021ab3dc
    ldr ip, _LIT3
    ldr r0, _LIT4
    ldrh r1, [ip]
    ldr lr, _LIT5
    mov r5, #0x2
    and r1, r1, r0
    strh r1, [ip]
    mov r2, r0, lsr #0x11
    ldrh r3, [ip]
    mov r0, #0x0
    mov r1, #0x1f
    bic r3, r3, #0x3000
    orr r3, r3, #0x10
    strh r3, [ip]
    ldrh r6, [ip]
    mov r3, #0x3f
    and r6, r6, lr
    strh r6, [ip]
    ldrh lr, [ip]
    bic lr, lr, #0x3000
    orr lr, lr, #0x8
    strh lr, [ip]
    str r5, [ip, #0x4e0]
    str r0, [sp]
    bl func_0208e504
    ldr r2, _LIT6
    ldr r1, _LIT7
    ldr r0, _LIT8
    str r2, [r1]
    ldr r1, [r0, #0x1c]
    ldr r0, _LIT9
    mov r2, #0x4
    bl func_0207ddc8
    mov r0, r5
    mov r1, #0x1
    bl func_0207e03c
    mov r0, #0x10000
    mov r1, #0x1
    bl func_0207e288
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
    mov r0, #0x1
    mov r1, #0x10
    bl func_ov000_021ab3dc
    ldr r1, _LIT10
    mov r3, #0x4000000
    ldrh r0, [r1]
    ldr r2, _LIT11
    add ip, r3, #0x1000
    bic r0, r0, #0x8000
    strh r0, [r1]
    ldr r1, [r3]
    mov r0, #0x4
    and r1, r1, r2
    orr r1, r1, #0x10
    orr r1, r1, #0x200000
    str r1, [r3]
    ldr r3, [ip]
    mov r1, r5
    and r2, r3, r2
    orr r2, r2, #0x10
    orr r2, r2, #0x200000
    str r2, [ip]
    bl func_0201d56c
    mov r0, #0x9
    mov r1, r5
    bl func_0201d56c
    bl func_ov000_021af3d0
    ldr r0, _LIT12
    bl func_0202ada4
    ldr r0, _LIT13
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202c01c
    bl func_ov000_021aad74
    mov r0, #0x1
    bl func_02005be0
    mov r0, r5
    bl func_02005be0
    bl func_02082244
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x1f
    bne .L_238
    mov r0, #0x0
    mov r1, #0x10
    bl func_ov000_021ab60c
.L_238:
    ldr r1, [r4, #0x160]
    mov r0, #0x0
    bic r1, r1, #0xff
    orr r1, r1, #0xff
    str r1, [r4, #0x160]
    str r0, [r4, #0x13c]
    str r0, [r4, #0x140]
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov013_021cbb5c
_LIT1: .word 0x00000598
_LIT2: .word 0x000001ff
_LIT3: .word 0x04000060
_LIT4: .word 0xffffcffd
_LIT5: .word 0x0000cffb
_LIT6: .word 0xbfff0000
_LIT7: .word 0x04000580
_LIT8: .word data_02104e3c
_LIT9: .word data_ov013_021cbbcc
_LIT10: .word 0x04000304
_LIT11: .word 0xffcfffef
_LIT12: .word data_ov013_021cbb20
_LIT13: .word data_02104e6c
