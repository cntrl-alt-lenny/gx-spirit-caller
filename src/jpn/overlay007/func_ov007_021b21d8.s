; func_ov007_021b21d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3d68
        .extern data_02103cc0
        .extern data_ov007_021b3388
        .extern data_ov007_021b33c4
        .extern data_ov007_022333d0
        .extern data_ov007_0223342c
        .extern func_0200195c
        .extern func_02001d48
        .extern func_020057ac
        .extern func_02005910
        .extern func_0200acf0
        .extern func_0200f838
        .extern func_02021010
        .extern func_0202113c
        .extern func_02021160
        .extern func_0202ada4
        .extern func_0202adc8
        .extern func_0202c01c
        .extern func_0208c7c8
        .extern func_0208c7e4
        .extern func_0208c858
        .extern func_0208cba8
        .extern func_0208cebc
        .extern func_0208cf48
        .extern func_0208cfd4
        .extern func_0208d050
        .extern func_0208d0fc
        .extern func_0208d314
        .extern func_0208d408
        .extern func_0208d944
        .extern func_02094410
        .extern func_ov007_021b2468
        .extern func_ov007_021b2998
        .global func_ov007_021b21d8
        .arm
func_ov007_021b21d8:
    stmdb sp!, {r3, lr}
    mov r0, #0xc0
    mov r1, #0x7000000
    mov r2, #0x400
    bl func_02094410
    ldr r1, _LIT0
    mov r0, #0xc0
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094410
    ldr r1, _LIT1
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094410
    bl func_02005910
    ldr r0, _LIT2
    bl func_0208d0fc
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094410
    bl func_0208cba8
    mov r0, #0x60
    bl func_0208d944
    mov r0, #0x3
    bl func_0208d408
    mov r0, #0x10
    bl func_0208d314
    mov r0, #0x4
    bl func_0208d050
    mov r0, #0x8
    bl func_0208cfd4
    mov r0, #0x80
    bl func_0208cf48
    mov r0, #0x100
    bl func_0208cebc
    ldr ip, _LIT3
    mov r0, #0x1
    ldrh r3, [ip]
    mov r1, #0x0
    mov r2, r0
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
    ldr ip, _LIT4
    mov r2, #0x1
    ldr r1, [ip]
    ldr r0, _LIT5
    bic r1, r1, #0x1f00
    str r1, [ip]
    ldr r3, [ip]
    mov r1, #0x0
    orr r3, r3, #0x10000
    str r3, [ip]
    str r2, [r0]
    ldr r0, _LIT6
    str r1, [r0]
    ldr r1, _LIT7
    mov r0, #0x4
    mov r2, #0x80000
    bl func_0200195c
    mov r0, #0x0
    bl func_02001d48
    ldr r0, _LIT8
    bl func_0202ada4
    mov r0, #0x0
    bl func_0202adc8
    mov r0, #0x0
    bl func_0202c01c
    bl func_02021010
    mov r0, #0x2
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
    mov r1, #0x10
    mov r2, #0x18000
    mov r3, #0x0
    bl func_0200f838
    mov r0, #0x14
    mov r1, #0x1
    bl func_020057ac
    ldr r0, _LIT9
    bl func_ov007_021b2468
    ldr r0, _LIT10
    bl func_ov007_021b2998
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word 0x07000400
_LIT1: .word 0x05000400
_LIT2: .word 0x000001ff
_LIT3: .word 0x04000304
_LIT4: .word 0x04001000
_LIT5: .word data_02103cc0
_LIT6: .word data_020c3d68
_LIT7: .word data_ov007_021b33c4
_LIT8: .word data_ov007_021b3388
_LIT9: .word data_ov007_022333d0
_LIT10: .word data_ov007_0223342c
