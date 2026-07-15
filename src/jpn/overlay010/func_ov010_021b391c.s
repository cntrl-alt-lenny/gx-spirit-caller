; func_ov010_021b391c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02104e3c
        .extern data_02104e6c
        .extern data_ov010_021b8c08
        .extern data_ov010_021b8c18
        .extern data_ov010_021b8c44
        .extern data_ov010_021b8c48
        .extern data_ov010_021b8c64
        .extern func_02001a14
        .extern func_02005910
        .extern func_02005be0
        .extern func_0202ada4
        .extern func_0202adc8
        .extern func_0202c8e8
        .extern func_0207ddc8
        .extern func_0207e7d0
        .extern func_0207f050
        .extern func_0207f338
        .extern func_0208c7e4
        .extern func_0208cba8
        .extern func_0208d0fc
        .extern func_0208d6c4
        .extern func_0208d7d8
        .extern func_0208d944
        .extern func_02094410
        .extern func_ov010_021b2af8
        .extern func_ov010_021b524c
        .extern func_ov010_021b71c0
        .global func_ov010_021b391c
        .arm
func_ov010_021b391c:
    stmdb sp!, {r4, lr}
    mov r3, #0x4000000
    ldr r1, [r3]
    mov r4, r0
    bic r0, r1, #0x1f00
    ldr r1, _LIT0
    str r0, [r3]
    mov r0, #0x0
    mov r2, #0x70
    strh r0, [r3, #0x50]
    bl Fill32
    ldr r1, _LIT1
    ldr r0, _LIT2
    ldr r1, [r1, #0x1c]
    mov r2, #0x4
    bl func_0207ddc8
    bl func_02005910
    ldr r0, _LIT3
    bl func_0208d0fc
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094410
    bl func_0208cba8
    ldr ip, _LIT4
    mov r0, #0x200
    ldrh r3, [ip]
    mov r1, #0x7000000
    mov r2, #0x400
    orr r3, r3, #0x8000
    strh r3, [ip]
    bl func_02094410
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x1
    bl func_0208d944
    mov r2, #0x4000000
    ldr r1, [r2]
    mov r0, #0x2
    bic r1, r1, #0x7000000
    str r1, [r2]
    ldr r1, [r2]
    bic r1, r1, #0x38000000
    str r1, [r2]
    bl func_0208d0fc
    mov r0, #0x30
    bl func_0208d7d8
    mov r0, #0x40
    bl func_0208d6c4
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r1
    bl func_0208c7e4
    ldr r1, _LIT5
    ldr r0, _LIT6
    ldrh r2, [r1]
    sub r0, r0, #0x17c
    and r2, r2, #0x43
    orr r2, r2, #0x38c
    orr r2, r2, #0x2000
    strh r2, [r1]
    ldrh r2, [r1, #0x2]
    and r2, r2, #0x43
    orr r0, r2, r0
    strh r0, [r1, #0x2]
    ldrh r0, [r1, #0x4]
    mov ip, #0x4000000
    ldr r2, _LIT7
    and r0, r0, #0x43
    orr r0, r0, #0x118
    strh r0, [r1, #0x4]
    ldrh lr, [r1, #0x6]
    ldr r3, _LIT8
    mov r0, #0x1
    and lr, lr, #0x43
    orr lr, lr, #0x84
    strh lr, [r1, #0x6]
    ldr r1, [ip]
    and r1, r1, r2
    orr r1, r1, #0x10
    str r1, [ip]
    ldr r1, [ip]
    and r1, r1, r3
    str r1, [ip]
    bl func_02005be0
    bl func_0207f338
    mov r1, #0x0
    ldr r0, _LIT9
    mov r3, r1
    mov r2, #0x80
    bl func_0207f050
    ldr r0, _LIT10
    bl func_0207e7d0
    mov r0, #0xf
    bl func_02001a14
    ldr r0, _LIT11
    bl func_0202ada4
    ldr r0, _LIT12
    ldr r1, _LIT13
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    str r0, [r1, #0x5c]
    bl func_0202adc8
    bl func_0202c8e8
    cmp r4, #0x1
    ldr r1, _LIT13
    str r0, [r1, #0x98]
    str r4, [r1, #0x3c]
    beq .L_1cc
    cmp r4, #0x2
    beq .L_1d4
    b .L_1d8
.L_1cc:
    bl func_ov010_021b524c
    b .L_1d8
.L_1d4:
    bl func_ov010_021b71c0
.L_1d8:
    bl func_ov010_021b2af8
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov010_021b8c44
_LIT1: .word data_02104e3c
_LIT2: .word data_ov010_021b8c08
_LIT3: .word 0x000001ff
_LIT4: .word 0x04000304
_LIT5: .word 0x04000008
_LIT6: .word 0x0000238c
_LIT7: .word 0xffcfffef
_LIT8: .word 0xffbfff9f
_LIT9: .word data_ov010_021b8c48
_LIT10: .word data_ov010_021b8c18
_LIT11: .word data_ov010_021b8c64
_LIT12: .word data_02104e6c
_LIT13: .word data_ov010_021b8c08
