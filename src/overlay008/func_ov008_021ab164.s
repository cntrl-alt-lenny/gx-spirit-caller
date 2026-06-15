; func_ov008_021ab164 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4728
        .extern func_0200592c
        .extern func_0201d5c0
        .extern func_0208c8b0
        .extern func_0208c8cc
        .extern func_0208c940
        .extern func_0208cc90
        .extern func_0208cfa4
        .extern func_0208d0bc
        .extern func_0208d138
        .extern func_0208d1e4
        .extern func_0208d3fc
        .extern func_0208d4f0
        .extern func_0208d7ac
        .extern func_0208da2c
        .extern func_0208ffec
        .extern func_02094504
        .global func_ov008_021ab164
        .arm
func_ov008_021ab164:
    stmdb sp!, {r3, lr}
    mov r0, #0xc0
    mov r1, #0x7000000
    mov r2, #0x400
    bl func_02094504
    ldr r1, _LIT0
    mov r0, #0xc0
    mov r2, #0x400
    bl func_02094504
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094504
    ldr r1, _LIT1
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    bl func_0200592c
    ldr r0, _LIT2
    bl func_0208d1e4
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094504
    bl func_0208cc90
    ldr r2, _LIT3
    mov r0, #0x0
    ldrh r1, [r2]
    orr r1, r1, #0x8000
    strh r1, [r2]
    bl func_0208c8b0
    mov r0, #0x80
    bl func_0208d138
    mov r0, #0x8
    bl func_0208d0bc
    mov r0, #0x100
    bl func_0208cfa4
    ldr r3, _LIT4
    ldr r1, _LIT5
    ldr r2, [r3]
    mov r0, #0x9
    and r1, r2, r1
    orr r1, r1, #0x10
    orr r1, r1, #0x200000
    str r1, [r3]
    mov r1, #0x2
    bl func_0201d5c0
    ldr r1, _LIT6
    ldrh r0, [r1]
    sub ip, r1, #0x2
    and r0, r0, #0x43
    orr r0, r0, #0xf80
    strh r0, [r1]
    ldrh r0, [r1]
    bic r0, r0, #0x3
    orr r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0xe80
    strh r0, [r1, #0x2]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r1, #0x2]
    ldrh r0, [ip]
    and r0, r0, #0x43
    orr r0, r0, #0x2d80
    strh r0, [ip]
    ldrh r1, [ip]
    mov r0, #0x1
    mov r2, r0
    bic r1, r1, #0x3
    orr r3, r1, #0x1
    mov r1, #0x0
    strh r3, [ip]
    bl func_0208c8cc
    mov r0, #0x4
    bl func_0208da2c
    mov r0, #0x40
    bl func_0208d7ac
    mov r0, #0x3
    bl func_0208d4f0
    mov r0, #0x10
    bl func_0208d3fc
    ldr r3, _LIT7
    ldr r0, _LIT8
    ldrh r1, [r3]
    sub ip, r0, #0x100
    ldr r0, _LIT9
    bic r1, r1, #0x3
    orr r1, r1, #0x2
    strh r1, [r3]
    ldrh lr, [r3, #0x2]
    mov r1, #0x0
    mov r2, #0x20
    bic lr, lr, #0x3
    strh lr, [r3, #0x2]
    ldrh lr, [r3, #0x2]
    and lr, lr, #0x43
    orr lr, lr, #0x308
    orr lr, lr, #0x1c00
    strh lr, [r3, #0x2]
    ldrh lr, [r3, #0x4]
    bic lr, lr, #0x3
    strh lr, [r3, #0x4]
    ldrh lr, [r3, #0x4]
    and lr, lr, #0x43
    orr ip, lr, ip
    strh ip, [r3, #0x4]
    ldrh ip, [r3, #0x6]
    bic ip, ip, #0x3
    orr ip, ip, #0x3
    strh ip, [r3, #0x6]
    ldrh ip, [r3, #0x6]
    and ip, ip, #0x43
    orr ip, ip, #0x80
    strh ip, [r3, #0x6]
    bl func_0208ffec
    ldr r0, _LIT9
    mov r1, #0x20
    mov r2, r1
    bl func_0208ffec
    mov r1, #0x4000000
    ldr r0, [r1]
    bic r0, r0, #0x1f00
    str r0, [r1]
    bl func_0208c940
    ldr r1, _LIT4
    ldr r0, [r1]
    bic r0, r0, #0x1f00
    str r0, [r1]
    ldr r0, [r1]
    orr r0, r0, #0x10000
    str r0, [r1]
    ldmia sp!, {r3, pc}
_LIT0: .word 0x07000400
_LIT1: .word 0x05000400
_LIT2: .word 0x000001ff
_LIT3: .word 0x04000304
_LIT4: .word 0x04001000
_LIT5: .word 0xffcfffef
_LIT6: .word 0x0400100c
_LIT7: .word 0x04000008
_LIT8: .word 0x00001f08
_LIT9: .word data_020b4728
