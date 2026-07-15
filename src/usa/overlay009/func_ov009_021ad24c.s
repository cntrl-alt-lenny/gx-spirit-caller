; func_ov009_021ad24c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4634
        .extern data_020c3d68
        .extern data_02103cc0
        .extern data_02103fcc
        .extern data_02104e6c
        .extern data_ov009_021adb20
        .extern data_ov009_021adb74
        .extern data_ov009_021adbbc
        .extern data_ov009_021adbf8
        .extern func_0200195c
        .extern func_02001b84
        .extern func_02001d48
        .extern func_02005910
        .extern func_02005be0
        .extern func_02005ec4
        .extern func_0200acf0
        .extern func_0200f838
        .extern func_02013980
        .extern func_0201d56c
        .extern func_02021010
        .extern func_0202113c
        .extern func_02021160
        .extern func_0202ada4
        .extern func_0202adc8
        .extern func_0202c01c
        .extern func_0203737c
        .extern func_0208c79c
        .extern func_0208c7c8
        .extern func_0208c7e4
        .extern func_0208c858
        .extern func_0208cba8
        .extern func_0208cebc
        .extern func_0208cfd4
        .extern func_0208d050
        .extern func_0208d0fc
        .extern func_0208d314
        .extern func_0208d408
        .extern func_0208d6c4
        .extern func_0208d7d8
        .extern func_0208d944
        .extern func_02094410
        .extern func_0209445c
        .extern func_ov009_021ab0dc
        .extern func_ov009_021ab768
        .global func_ov009_021ad24c
        .arm
func_ov009_021ad24c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    beq .L_154
    bl func_02013980
    mov r2, #0x0
    add r0, r0, #0xf
    sub r3, r2, #0x1
    mov r1, #0x1
    bl func_0203737c
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x24]
.L_154:
    mov r0, #0xc0
    mov r1, #0x7000000
    mov r2, #0x400
    bl func_02094410
    ldr r1, _LIT1
    mov r0, #0xc0
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094410
    ldr r1, _LIT2
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094410
    bl func_02005910
    ldr r0, _LIT3
    bl func_0208d0fc
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094410
    bl func_0208cba8
    mov r0, #0x4
    bl func_0208d944
    mov r0, #0x40
    bl func_0208d6c4
    mov r0, #0x10
    bl func_0208d7d8
    mov r0, #0x3
    bl func_0208d408
    mov r0, #0x20
    bl func_0208d314
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
    bl func_0208d050
    mov r0, #0x8
    bl func_0208cfd4
    mov r0, #0x100
    bl func_0208cebc
    ldr r3, _LIT6
    ldr r1, _LIT7
    ldr r2, [r3]
    mov r0, #0x9
    and r1, r2, r1
    orr r2, r1, #0x10
    orr r2, r2, #0x200000
    mov r1, #0x2
    str r2, [r3]
    bl func_0201d56c
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
    bl func_0208c7e4
    mov r0, #0x0
    bl func_0208c7c8
    mov r1, #0x4000000
    ldr r0, [r1]
    bic r0, r0, #0x1f00
    str r0, [r1]
    bl func_0208c858
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
    bl func_02005be0
    bl func_02005ec4
    bl func_02021010
    mov r0, #0x0
    mov r1, #0x1
    bl func_0202113c
    mov r0, #0x3
    mov r1, #0x8
    bl func_02021160
    mov r0, #0x8
    bl func_0200acf0
    mov r0, #0x3000
    str r0, [sp]
    mov r0, #0x3
    mov r1, #0x20
    mov r2, #0x18000
    mov r3, #0x0
    bl func_0200f838
    ldr r0, _LIT12
    mvn r1, #0xf
    bl func_0208c79c
    ldr r0, _LIT13
    mvn r1, #0xf
    bl func_0208c79c
    ldr r0, _LIT14
    bl func_ov009_021ab768
    ldr r0, _LIT15
    bl func_ov009_021ab0dc
    ldr r0, _LIT16
    bl func_0202ada4
    ldr r0, _LIT17
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202adc8
    ldr r0, _LIT17
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202c01c
    bl func_02001b84
    mov r0, #0x24
    ldr r1, _LIT18
    mov r2, #0x90000
    bl func_0200195c
    ldr r0, _LIT17
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r0, _LIT19
    ldr r1, _LIT20
    mov r2, #0x20
    bl func_0209445c
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_02103fcc
_LIT1: .word 0x07000400
_LIT2: .word 0x05000400
_LIT3: .word 0x000001ff
_LIT4: .word 0x04000008
_LIT5: .word 0x00001d08
_LIT6: .word 0x04001000
_LIT7: .word 0xffcfffef
_LIT8: .word 0x0400100e
_LIT9: .word 0x04000304
_LIT10: .word data_02103cc0
_LIT11: .word data_020c3d68
_LIT12: .word 0x0400006c
_LIT13: .word 0x0400106c
_LIT14: .word data_ov009_021adb74
_LIT15: .word data_ov009_021adb20
_LIT16: .word data_ov009_021adbbc
_LIT17: .word data_02104e6c
_LIT18: .word data_ov009_021adbf8
_LIT19: .word data_020b4634
_LIT20: .word 0x050004e0
