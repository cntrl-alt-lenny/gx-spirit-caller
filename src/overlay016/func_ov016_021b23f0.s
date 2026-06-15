; func_ov016_021b23f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov016_021b9748
        .extern data_ov016_021b9784
        .extern data_ov016_021bab44
        .extern func_02001a34
        .extern func_02001d68
        .extern func_0200592c
        .extern func_02005bfc
        .extern func_02005ee0
        .extern func_020092e0
        .extern func_0201d5c0
        .extern func_0202adf8
        .extern func_0202ae1c
        .extern func_0202c070
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
        .extern func_0208e2f4
        .extern func_0208e318
        .extern func_02094504
        .extern func_ov016_021b23b4
        .extern func_ov016_021b2b2c
        .global func_ov016_021b23f0
        .arm
func_ov016_021b23f0:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    bl func_020092e0
    bl func_ov016_021b23b4
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
    mov r0, #0x0
    ldr r1, _LIT2
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
    mov r1, #0x0
    ldr r0, _LIT4
    mov r2, r1
    strh r1, [r0]
    add r3, r0, #0x1000
    strh r1, [r3]
    str r1, [sp]
    mov r3, r1
    bl func_0208e318
    mov r1, #0x0
    str r1, [sp]
    ldr r0, _LIT5
    mov r2, r1
    mov r3, r1
    bl func_0208e318
    ldr r0, _LIT4
    mov r1, #0x0
    mov r2, r1
    bl func_0208e2f4
    ldr r0, _LIT5
    mov r1, #0x0
    mov r2, r1
    bl func_0208e2f4
    ldr r4, _LIT6
    mov r0, #0x1
    ldrh r3, [r4]
    mov r1, #0x0
    mov r2, r1
    orr r3, r3, #0x8000
    strh r3, [r4]
    bl func_0208c8cc
    mov r0, #0x1
    bl func_0208da2c
    mov r0, #0x10
    bl func_0208d7ac
    mov r0, #0x2
    bl func_0208d8c0
    mov r0, #0x20
    bl func_0208d6f4
    mov r3, #0x4000000
    ldr r2, [r3]
    ldr r1, _LIT7
    mov r0, #0x4
    and r1, r2, r1
    orr r2, r1, #0x10
    orr r2, r2, #0x200000
    mov r1, #0x2
    str r2, [r3]
    bl func_0201d5c0
    ldr r2, _LIT8
    ldr r0, _LIT9
    ldrh r1, [r2]
    sub lr, r2, #0x2
    sub ip, r2, #0x4
    and r1, r1, #0x43
    orr r1, r1, #0x84
    strh r1, [r2]
    sub r3, r2, #0x6
    ldrh r4, [lr]
    sub r1, r0, #0x280
    sub r2, r0, #0x3e80
    and r0, r4, #0x43
    orr r0, r0, #0x384
    orr r0, r0, #0x4000
    strh r0, [lr]
    ldrh r4, [ip]
    mov r0, #0x0
    and r4, r4, #0x43
    orr r1, r4, r1
    strh r1, [ip]
    ldrh r1, [r3]
    and r1, r1, #0x43
    orr r1, r1, r2
    strh r1, [r3]
    bl func_0208c8b0
    mov r0, #0x4
    bl func_0208d138
    mov r0, #0x80
    bl func_0208d030
    mov r0, #0x8
    bl func_0208d0bc
    mov r0, #0x100
    bl func_0208cfa4
    ldr r3, _LIT10
    ldr r1, _LIT7
    ldr r2, [r3]
    mov r0, #0x9
    and r1, r2, r1
    orr r1, r1, #0x10
    orr r1, r1, #0x200000
    str r1, [r3]
    mov r1, #0x2
    bl func_0201d5c0
    ldr r2, _LIT11
    ldr r0, _LIT12
    ldrh r1, [r2]
    sub r4, r2, #0x2
    add r0, r0, #0x80
    and r1, r1, #0x43
    orr r1, r1, #0x84
    orr r1, r1, #0x400
    strh r1, [r2]
    ldrh r1, [r4]
    sub r3, r2, #0x4
    and r1, r1, #0x43
    orr r0, r1, r0
    strh r0, [r4]
    ldrh r1, [r3]
    ldr r0, _LIT13
    and r1, r1, #0x43
    orr r1, r1, #0x4
    orr r1, r1, #0x8000
    strh r1, [r3]
    ldrh r1, [r2, #-6]!
    add r0, r0, #0x200
    and r1, r1, #0x43
    orr r0, r1, r0
    strh r0, [r2]
    mov r0, #0x3
    bl func_02005bfc
    bl func_02005ee0
    ldr r0, _LIT14
    bl func_0202adf8
    ldr r0, _LIT15
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202ae1c
    ldr r0, _LIT15
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202c070
    mov r0, #0x6
    bl func_02001a34
    ldr r0, _LIT15
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, _LIT16
    bl func_ov016_021b2b2c
    ldr r3, _LIT8
    ldr ip, _LIT17
    ldrh r0, [r3]
    sub r2, r3, #0x2
    sub r1, r3, #0x4
    bic r0, r0, #0x3
    orr r0, r0, #0x3
    strh r0, [r3]
    ldrh r0, [r2]
    sub r4, r3, #0x6
    add lr, r3, #0x1000
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r2]
    ldrh r0, [r1]
    sub r3, ip, #0x2
    sub r2, ip, #0x4
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1]
    ldrh r1, [r4]
    mov r0, #0x1
    bic r1, r1, #0x3
    strh r1, [r4]
    ldrh r1, [lr]
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [lr]
    ldrh r1, [ip]
    bic r1, r1, #0x3
    orr r1, r1, #0x2
    strh r1, [ip]
    ldrh r1, [r3]
    bic r1, r1, #0x3
    orr r1, r1, #0x1
    strh r1, [r3]
    ldrh r1, [r2]
    bic r1, r1, #0x3
    strh r1, [r2]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov016_021b9784
_LIT1: .word 0x07000400
_LIT2: .word 0x05000400
_LIT3: .word 0x000001ff
_LIT4: .word 0x04000050
_LIT5: .word 0x04001050
_LIT6: .word 0x04000304
_LIT7: .word 0xffcfffef
_LIT8: .word 0x0400000e
_LIT9: .word 0x00004384
_LIT10: .word 0x04001000
_LIT11: .word 0x0400100e
_LIT12: .word 0x00000484
_LIT13: .word 0x00008004
_LIT14: .word data_ov016_021b9748
_LIT15: .word data_02104f4c
_LIT16: .word data_ov016_021bab44
_LIT17: .word 0x0400100c
