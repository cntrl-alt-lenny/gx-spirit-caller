; func_02020d30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4634
        .extern data_02102bb0
        .extern data_02104e6c
        .extern func_02001af8
        .extern func_02001b84
        .extern func_02001cec
        .extern func_02001d48
        .extern func_02001e74
        .extern func_02004f3c
        .extern func_02005898
        .extern func_020058d4
        .extern func_02005910
        .extern func_020068fc
        .extern func_0202ada4
        .extern func_0202adc8
        .extern func_0202aeec
        .extern func_0202c06c
        .extern func_0208c79c
        .extern func_0208c7c8
        .extern func_0208c7e4
        .extern func_0208c858
        .extern func_0208cba8
        .extern func_0208d050
        .extern func_0208d0fc
        .extern func_0208d944
        .extern func_0208de24
        .extern func_0208e0c4
        .extern func_0208e0e4
        .extern func_0208fe9c
        .extern func_0208ff04
        .extern func_02094410
        .global func_02020d30
        .arm
func_02020d30:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x44
    mov r4, r0
    bl func_02001b84
    bl func_020068fc
    bl func_02005898
    mov r0, #0x0
    bl func_020058d4
    ldr r1, _LIT0
    ldrh r0, [r1]
    bic r0, r0, #0x8000
    strh r0, [r1]
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
    mov r0, #0xc0
    ldr r1, _LIT2
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x0
    ldr r1, _LIT3
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x8
    bl func_0208d944
    mov r0, #0x4
    bl func_0208d050
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r0
    bl func_0208c7e4
    mov r1, #0x4000000
    ldr r0, [r1]
    add r3, r1, #0x1000
    bic r0, r0, #0x1f00
    orr r0, r0, #0x200
    str r0, [r1]
    ldr r2, [r1]
    mov r0, #0x0
    bic r2, r2, #0xe000
    str r2, [r1]
    ldr r2, [r3]
    bic r2, r2, #0xe000
    str r2, [r3]
    ldr r2, [r1]
    bic r2, r2, #0x7000000
    str r2, [r1]
    ldr r2, [r1]
    bic r2, r2, #0x38000000
    str r2, [r1]
    str r0, [r1, #0x14]
    ldrh r2, [r1, #0xa]
    and r2, r2, #0x43
    orr r2, r2, #0x4
    strh r2, [r1, #0xa]
    bl func_0208c7c8
    ldr r5, _LIT4
    mov r1, #0x0
    ldr r0, [r5]
    sub r2, r5, #0xfb0
    bic r0, r0, #0x1f00
    orr r0, r0, #0x200
    str r0, [r5]
    str r1, [r5, #0x14]
    ldrh r3, [r5, #0xa]
    ldr r0, _LIT5
    and r3, r3, #0x43
    orr r3, r3, #0x4
    strh r3, [r5, #0xa]
    strh r1, [r2]
    strh r1, [r5, #0x50]
    bl func_0208c79c
    add r0, r5, #0x6c
    mov r1, #0x0
    bl func_0208c79c
    bl func_0208c858
    mov r3, r5
    ldr r2, [r3]
    ldr r0, _LIT6
    orr r2, r2, #0x10000
    str r2, [r3]
    mov r1, #0x1d
    mov r2, #0x18
    bl func_02001cec
    mov r0, #0x8
    bl func_02001af8
    ldr r0, _LIT7
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    add r0, sp, #0x8
    bl func_0202ada4
    ldr r0, _LIT7
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202adc8
    ldr r0, _LIT8
    mov r1, #0x1e0
    mov r2, #0x20
    bl func_0208ff04
    bl func_0208e0e4
    mov r1, r0
    ldr r0, _LIT6
    mov r2, #0x0
    mov r3, #0xf
    bl func_02001e74
    ldr r0, _LIT8
    mov r1, #0x1e0
    mov r2, #0x20
    bl func_0208fe9c
    bl func_0208e0c4
    mov r1, r0
    ldr r0, _LIT6
    mov r2, #0x0
    mov r3, #0xf
    bl func_02001e74
    bl func_0208de24
    mov r5, r0
    add r0, r4, #0x320
    bl func_0202c06c
    mov r1, r0
    mov r2, #0x4b
    ldr r0, _LIT6
    str r2, [sp]
    mov r4, #0xe
    add r2, r5, #0x0
    mov r3, #0x16
    str r4, [sp, #0x4]
    bl func_02004f3c
    bl func_0202aeec
    bl func_020068fc
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0x04000304
_LIT1: .word 0x000001ff
_LIT2: .word 0x07000400
_LIT3: .word 0x05000400
_LIT4: .word 0x04001000
_LIT5: .word 0x0400006c
_LIT6: .word data_02102bb0
_LIT7: .word data_02104e6c
_LIT8: .word data_020b4634
