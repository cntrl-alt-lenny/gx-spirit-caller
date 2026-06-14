; func_ov011_021ca0c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02104f1c
        .extern data_ov011_021d4000
        .extern data_ov011_021d403c
        .extern data_ov011_021d40ac
        .extern func_0200592c
        .extern func_02005bfc
        .extern func_0201d5c0
        .extern func_0207deb0
        .extern func_0207e124
        .extern func_0207e370
        .extern func_0208232c
        .extern func_0208c8b0
        .extern func_0208c8cc
        .extern func_0208cc90
        .extern func_0208cfa4
        .extern func_0208d030
        .extern func_0208d0bc
        .extern func_0208d138
        .extern func_0208d1e4
        .extern func_0208d6f4
        .extern func_0208d7ac
        .extern func_0208d8c0
        .extern func_0208da2c
        .extern func_0208e5ec
        .extern func_0208e7ac
        .extern func_02094504
        .extern func_ov000_021aae54
        .extern func_ov000_021ab21c
        .extern func_ov000_021ab4bc
        .extern func_ov000_021ab6ec
        .extern func_ov000_021af4bc
        .extern func_ov011_021ceebc
        .global func_ov011_021ca0c4
        .arm
func_ov011_021ca0c4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r0, #0x0
    bl Fill32
    bl func_0200592c
    ldr r0, _LIT2
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
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094504
    bl func_ov000_021ab21c
    bl func_0208e7ac
    mov r0, #0x1
    bl func_0208da2c
    mov r0, #0x40
    bl func_0208d7ac
    mov r0, #0x2
    bl func_0208d8c0
    mov r0, #0x20
    bl func_0208d6f4
    mov r0, #0x1
    mov r1, #0x3
    mov r2, #0x0
    bl func_0208c8cc
    mov r0, #0x0
    mov r1, #0x1a
    bl func_ov000_021ab4bc
    ldr ip, _LIT3
    ldr r0, _LIT4
    ldrh r1, [ip]
    ldr lr, _LIT5
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
    bl func_0208e5ec
    ldr r1, _LIT6
    ldr r0, _LIT7
    str r1, [r0]
    ldr r1, _LIT8
    ldr r0, _LIT9
    ldr r1, [r1, #0x1c]
    mov r2, #0x4
    bl func_0207deb0
    mov r0, r4
    mov r1, #0x1
    bl func_0207e124
    mov r0, #0x10000
    mov r1, #0x1
    bl func_0207e370
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
    mov r0, #0x1
    mov r1, #0x11
    bl func_ov000_021ab4bc
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
    mov r1, r4
    and r2, r3, r2
    orr r2, r2, #0x10
    orr r2, r2, #0x200000
    str r2, [ip]
    bl func_0201d5c0
    mov r0, #0x9
    mov r1, r4
    bl func_0201d5c0
    bl func_ov000_021af4bc
    bl func_ov000_021aae54
    mov r0, #0x1
    bl func_02005bfc
    mov r0, r4
    bl func_02005bfc
    bl func_0208232c
    ldr r0, _LIT12
    mov r2, #0x0
    ldr r3, [r0, #0x2bc]
    mov r1, #0x19000
    bic r3, r3, #0xff
    orr r3, r3, #0xff
    str r3, [r0, #0x2bc]
    str r2, [r0, #0x238]
    str r1, [r0, #0x23c]
    ldr r1, [r0, #0x2a4]
    bic r1, r1, #0x1e00
    orr r1, r1, #0x200
    str r1, [r0, #0x2a4]
    bl func_ov011_021ceebc
    mov r0, #0x0
    mov r1, r0
    bl func_ov000_021ab6ec
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov011_021d403c
_LIT1: .word 0x00000624
_LIT2: .word 0x000001ff
_LIT3: .word 0x04000060
_LIT4: .word 0xffffcffd
_LIT5: .word 0x0000cffb
_LIT6: .word 0xbfff0000
_LIT7: .word 0x04000580
_LIT8: .word data_02104f1c
_LIT9: .word data_ov011_021d40ac
_LIT10: .word 0x04000304
_LIT11: .word 0xffcfffef
_LIT12: .word data_ov011_021d4000
