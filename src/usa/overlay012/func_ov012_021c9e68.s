; func_ov012_021c9e68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02104e3c
        .extern data_ov012_021cc5c0
        .extern data_ov012_021cc5fc
        .extern data_ov012_021cc66c
        .extern func_02005910
        .extern func_02005be0
        .extern func_0201d56c
        .extern func_0202ada4
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
        .extern func_ov000_021af3d0
        .global func_ov012_021c9e68
        .arm
func_ov012_021c9e68:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r0, #0x0
    mov r2, #0x510
    bl Fill32
    bl func_02005910
    ldr r0, _LIT1
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
    ldr ip, _LIT2
    ldr r0, _LIT3
    ldrh r1, [ip]
    ldr lr, _LIT4
    mov r4, #0x2
    and r1, r1, r0
    strh r1, [ip]
    mov r2, r0, lsr #0x11
    ldrh r3, [ip]
    mov r0, #0x0
    mov r1, #0x1f
    bic r3, r3, #0x3000
    orr r3, r3, #0x10
    strh r3, [ip]
    ldrh r5, [ip]
    mov r3, #0x3f
    and r5, r5, lr
    strh r5, [ip]
    ldrh lr, [ip]
    bic lr, lr, #0x3000
    orr lr, lr, #0x8
    strh lr, [ip]
    str r4, [ip, #0x4e0]
    str r0, [sp]
    bl func_0208e504
    ldr r1, _LIT5
    ldr r0, _LIT6
    str r1, [r0]
    ldr r1, _LIT7
    ldr r0, _LIT8
    ldr r1, [r1, #0x1c]
    mov r2, #0x4
    bl func_0207ddc8
    mov r0, r4
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
    mov r1, #0x11
    bl func_ov000_021ab3dc
    ldr r1, _LIT9
    mov r3, #0x4000000
    ldrh r0, [r1]
    ldr r2, _LIT10
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
    mov r1, r4
    and r2, r3, r2
    orr r2, r2, #0x10
    orr r2, r2, #0x200000
    str r2, [ip]
    bl func_0201d56c
    mov r0, #0x9
    mov r1, r4
    bl func_0201d56c
    bl func_ov000_021af3d0
    ldr r0, _LIT11
    bl func_0202ada4
    bl func_ov000_021aad74
    mov r0, #0x1
    bl func_02005be0
    mov r0, r4
    bl func_02005be0
    bl func_02082244
    ldr r1, _LIT12
    mov r2, #0x0
    ldr r3, [r1, #0x1a8]
    mov r0, #0x1
    bic r3, r3, #0xff
    orr r3, r3, #0xff
    str r3, [r1, #0x1a8]
    str r2, [r1, #0x184]
    str r2, [r1, #0x188]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov012_021cc5fc
_LIT1: .word 0x000001ff
_LIT2: .word 0x04000060
_LIT3: .word 0xffffcffd
_LIT4: .word 0x0000cffb
_LIT5: .word 0xbfff0000
_LIT6: .word 0x04000580
_LIT7: .word data_02104e3c
_LIT8: .word data_ov012_021cc66c
_LIT9: .word 0x04000304
_LIT10: .word 0xffcfffef
_LIT11: .word data_ov012_021cc5c0
_LIT12: .word data_ov012_021cc5c0
