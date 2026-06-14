; func_ov009_021ad32c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4728
        .extern data_020c3e48
        .extern data_02103da0
        .extern data_021040ac
        .extern data_02104f4c
        .extern data_ov009_021adc00
        .extern data_ov009_021adc54
        .extern data_ov009_021adc9c
        .extern data_ov009_021adcd8
        .extern func_0200197c
        .extern func_02001ba4
        .extern func_02001d68
        .extern func_0200592c
        .extern func_02005bfc
        .extern func_02005ee0
        .extern func_0200ad0c
        .extern func_0200f854
        .extern func_020139b4
        .extern func_0201d5c0
        .extern func_02021064
        .extern func_02021190
        .extern func_020211b4
        .extern func_0202adf8
        .extern func_0202ae1c
        .extern func_0202c070
        .extern func_020373cc
        .extern func_0208c884
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
        .extern func_0208d8c0
        .extern func_0208da2c
        .extern func_02094504
        .extern func_02094550
        .extern func_ov009_021ab1bc
        .extern func_ov009_021ab848
        .global func_ov009_021ad32c
        .arm
func_ov009_021ad32c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    beq .L_154
    bl func_020139b4
    mov r2, #0x0
    add r0, r0, #0xf
    sub r3, r2, #0x1
    mov r1, #0x1
    bl func_020373cc
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x24]
.L_154:
    mov r0, #0xc0
    mov r1, #0x7000000
    mov r2, #0x400
    bl func_02094504
    ldr r1, _LIT1
    mov r0, #0xc0
    mov r2, #0x400
    bl func_02094504
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094504
    ldr r1, _LIT2
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    bl func_0200592c
    ldr r0, _LIT3
    bl func_0208d1e4
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094504
    bl func_0208cc90
    mov r0, #0x4
    bl func_0208da2c
    mov r0, #0x40
    bl func_0208d7ac
    mov r0, #0x10
    bl func_0208d8c0
    mov r0, #0x3
    bl func_0208d4f0
    mov r0, #0x20
    bl func_0208d3fc
    ldr r0, _LIT4
    ldr r1, _LIT5
    ldrh r2, [r0]
    add r1, r1, #0x100
    bic r2, r2, #0x3
    orr r2, r2, #0x1
    strh r2, [r0]
    ldrh r2, [r0, #0x2]
    bic r2, r2, #0x3
    strh r2, [r0, #0x2]
    ldrh r2, [r0, #0x2]
    and r2, r2, #0x43
    orr r2, r2, #0x108
    orr r2, r2, #0x1c00
    strh r2, [r0, #0x2]
    ldrh r2, [r0, #0x4]
    bic r2, r2, #0x3
    strh r2, [r0, #0x4]
    ldrh r2, [r0, #0x4]
    and r2, r2, #0x43
    orr r1, r2, r1
    strh r1, [r0, #0x4]
    ldrh r1, [r0, #0x6]
    and r1, r1, #0x43
    orr r1, r1, #0x1f80
    strh r1, [r0, #0x6]
    ldrh r1, [r0, #0x6]
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [r0, #0x6]
    mov r0, #0x80
    bl func_0208d138
    mov r0, #0x8
    bl func_0208d0bc
    mov r0, #0x100
    bl func_0208cfa4
    ldr r3, _LIT6
    ldr r1, _LIT7
    ldr r2, [r3]
    mov r0, #0x9
    and r1, r2, r1
    orr r2, r1, #0x10
    orr r2, r2, #0x200000
    mov r1, #0x2
    str r2, [r3]
    bl func_0201d5c0
    ldr r3, _LIT8
    ldr ip, _LIT9
    ldrh r0, [r3]
    sub r4, r3, #0x6
    sub lr, r3, #0x4
    and r0, r0, #0x43
    orr r0, r0, #0xf80
    strh r0, [r3]
    ldrh r2, [r3]
    mov r0, #0x1
    mov r1, #0x0
    bic r2, r2, #0x3
    orr r2, r2, #0x3
    strh r2, [r3]
    ldrh r3, [r4]
    mov r2, r0
    and r3, r3, #0x43
    orr r3, r3, #0x8b00
    strh r3, [r4]
    ldrh r3, [r4]
    bic r3, r3, #0x3
    strh r3, [r4]
    ldrh r3, [lr]
    and r3, r3, #0x43
    orr r3, r3, #0x8d00
    strh r3, [lr]
    ldrh r3, [lr]
    bic r3, r3, #0x3
    orr r3, r3, #0x1
    strh r3, [lr]
    ldrh r3, [ip]
    orr r3, r3, #0x8000
    strh r3, [ip]
    bl func_0208c8cc
    mov r0, #0x0
    bl func_0208c8b0
    mov r1, #0x4000000
    ldr r0, [r1]
    bic r0, r0, #0x1f00
    str r0, [r1]
    bl func_0208c940
    ldr ip, _LIT6
    mov r2, #0x1
    ldr r1, [ip]
    ldr r0, _LIT10
    bic r1, r1, #0x1f00
    str r1, [ip]
    ldr r3, [ip]
    mov r1, #0x0
    orr r3, r3, #0x10000
    str r3, [ip]
    str r2, [r0]
    ldr r0, _LIT11
    str r1, [r0]
    mov r0, #0x3
    bl func_02005bfc
    bl func_02005ee0
    bl func_02021064
    mov r0, #0x0
    mov r1, #0x1
    bl func_02021190
    mov r0, #0x3
    mov r1, #0x8
    bl func_020211b4
    mov r0, #0x8
    bl func_0200ad0c
    mov r0, #0x3000
    str r0, [sp]
    mov r0, #0x3
    mov r1, #0x20
    mov r2, #0x18000
    mov r3, #0x0
    bl func_0200f854
    ldr r0, _LIT12
    mvn r1, #0xf
    bl func_0208c884
    ldr r0, _LIT13
    mvn r1, #0xf
    bl func_0208c884
    ldr r0, _LIT14
    bl func_ov009_021ab848
    ldr r0, _LIT15
    bl func_ov009_021ab1bc
    ldr r0, _LIT16
    bl func_0202adf8
    ldr r0, _LIT17
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202ae1c
    ldr r0, _LIT17
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202c070
    bl func_02001ba4
    mov r0, #0x24
    ldr r1, _LIT18
    mov r2, #0x90000
    bl func_0200197c
    ldr r0, _LIT17
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, _LIT19
    ldr r1, _LIT20
    mov r2, #0x20
    bl func_02094550
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_021040ac
_LIT1: .word 0x07000400
_LIT2: .word 0x05000400
_LIT3: .word 0x000001ff
_LIT4: .word 0x04000008
_LIT5: .word 0x00001d08
_LIT6: .word 0x04001000
_LIT7: .word 0xffcfffef
_LIT8: .word 0x0400100e
_LIT9: .word 0x04000304
_LIT10: .word data_02103da0
_LIT11: .word data_020c3e48
_LIT12: .word 0x0400006c
_LIT13: .word 0x0400106c
_LIT14: .word data_ov009_021adc54
_LIT15: .word data_ov009_021adc00
_LIT16: .word data_ov009_021adc9c
_LIT17: .word data_02104f4c
_LIT18: .word data_ov009_021adcd8
_LIT19: .word data_020b4728
_LIT20: .word 0x050004e0
