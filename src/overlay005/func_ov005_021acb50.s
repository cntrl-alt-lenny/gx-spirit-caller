; func_ov005_021acb50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4728
        .extern data_02104f4c
        .extern data_ov005_021b1e4c
        .extern data_ov005_021b1e6c
        .extern func_020018d4
        .extern func_0200197c
        .extern func_02001b18
        .extern func_02001bc8
        .extern func_02001d68
        .extern func_0200592c
        .extern func_02005bfc
        .extern func_02005ee0
        .extern func_0201d5c0
        .extern func_0208c884
        .extern func_0208c8b0
        .extern func_0208c8cc
        .extern func_0208c940
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
        .extern func_02094504
        .extern func_02094550
        .extern func_ov005_021ad060
        .global func_ov005_021acb50
        .arm
func_ov005_021acb50:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x20
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
    ldr r4, _LIT3
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
    ldr r1, _LIT4
    mov r0, #0x4
    and r1, r2, r1
    orr r1, r1, #0x10
    orr r1, r1, #0x200000
    str r1, [r3]
    mov r1, #0x2
    bl func_0201d5c0
    ldr r2, _LIT5
    ldrh r0, [r2]
    sub r1, r2, #0x2
    and r0, r0, #0x43
    orr r0, r0, #0x84
    strh r0, [r2]
    ldrh r0, [r2]
    bic r0, r0, #0x3
    orr r0, r0, #0x3
    strh r0, [r2]
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0x10c
    strh r0, [r1]
    ldrh r0, [r1]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r1]
    mov r1, #0x4000000
    ldr r0, [r1]
    bic r0, r0, #0x1f00
    str r0, [r1]
    bl func_0208c940
    mov r0, #0x0
    bl func_0208c8b0
    mov r0, #0x4
    bl func_0208d138
    mov r0, #0x80
    bl func_0208d030
    mov r0, #0x8
    bl func_0208d0bc
    mov r0, #0x100
    bl func_0208cfa4
    ldr r3, _LIT6
    ldr r1, _LIT4
    ldr r2, [r3]
    mov r0, #0x9
    and r1, r2, r1
    orr r1, r1, #0x10
    orr r1, r1, #0x200000
    str r1, [r3]
    mov r1, #0x2
    bl func_0201d5c0
    ldr r3, _LIT7
    ldr r0, _LIT8
    ldrh r2, [r3]
    add r1, r0, #0x200
    sub r4, r3, #0x2
    and r0, r2, #0x43
    orr r0, r0, #0x84
    strh r0, [r3]
    ldrh r0, [r3]
    sub lr, r3, #0x4
    sub ip, r3, #0x6
    bic r0, r0, #0x3
    orr r0, r0, #0x3
    strh r0, [r3]
    sub r2, r3, #0xe
    ldrh r3, [r4]
    mov r0, #0x3
    and r3, r3, #0x43
    orr r3, r3, #0x10c
    strh r3, [r4]
    ldrh r3, [r4]
    bic r3, r3, #0x3
    orr r3, r3, #0x3
    strh r3, [r4]
    ldrh r3, [lr]
    and r3, r3, #0x43
    orr r3, r3, #0x204
    orr r3, r3, #0x8000
    strh r3, [lr]
    ldrh r3, [lr]
    bic r3, r3, #0x3
    orr r3, r3, #0x1
    strh r3, [lr]
    ldrh r3, [ip]
    and r3, r3, #0x43
    orr r1, r3, r1
    strh r1, [ip]
    ldrh r1, [ip]
    bic r1, r1, #0x3
    strh r1, [ip]
    ldr r1, [r2]
    bic r1, r1, #0x1f00
    str r1, [r2]
    ldr r1, [r2]
    orr r1, r1, #0x10000
    str r1, [r2]
    bl func_02005bfc
    bl func_02005ee0
    ldr r0, _LIT9
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, _LIT9
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_290
    ldr r0, _LIT10
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    beq .L_284
    ldr r2, [r0, #0xc]
    mov r0, #0x4
    bl func_0200197c
    b .L_298
.L_284:
    mov r0, #0x4
    bl func_020018d4
    b .L_298
.L_290:
    mov r0, #0xc
    bl func_02001b18
.L_298:
    ldr r0, _LIT11
    mov r1, #0x5000000
    mov r2, #0x20
    bl func_02094550
    ldr r0, _LIT11
    ldr r1, _LIT1
    mov r2, #0x20
    bl func_02094550
    ldr r2, _LIT12
    add r0, sp, #0x0
    mov r1, #0x0
    bl func_02001bc8
    ldr r1, _LIT13
    add r0, sp, #0x0
    mov r2, #0x20
    bl func_02094550
    ldr r2, _LIT12
    add r0, sp, #0x0
    mov r1, #0x3c00
    bl func_02001bc8
    ldr r1, _LIT14
    add r0, sp, #0x0
    mov r2, #0x20
    bl func_02094550
    ldr r1, _LIT15
    ldr r2, _LIT16
    add r0, sp, #0x0
    bl func_02001bc8
    ldr r1, _LIT17
    add r0, sp, #0x0
    mov r2, #0x20
    bl func_02094550
    ldr r1, _LIT15
    ldr r2, _LIT18
    add r0, sp, #0x0
    bl func_02001bc8
    ldr r1, _LIT19
    add r0, sp, #0x0
    mov r2, #0x20
    bl func_02094550
    ldr r0, _LIT20
    mvn r1, #0xf
    bl func_0208c884
    ldr r0, _LIT21
    mvn r1, #0xf
    bl func_0208c884
    ldr r1, _LIT22
    mov r2, #0x0
    strh r2, [r1]
    add r1, r1, #0x1000
    ldr r0, _LIT23
    strh r2, [r1]
    bl func_ov005_021ad060
    ldr r1, _LIT10
    mov r2, #0x0
    mov r0, #0x1
    str r2, [r1, #0x10]
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
_LIT0: .word 0x07000400
_LIT1: .word 0x05000400
_LIT2: .word 0x000001ff
_LIT3: .word 0x04000304
_LIT4: .word 0xffcfffef
_LIT5: .word 0x0400000e
_LIT6: .word 0x04001000
_LIT7: .word 0x0400100e
_LIT8: .word 0x00008204
_LIT9: .word data_02104f4c
_LIT10: .word data_ov005_021b1e4c
_LIT11: .word data_020b4728
_LIT12: .word 0x00007fff
_LIT13: .word 0x05000640
_LIT14: .word 0x05000620
_LIT15: .word 0x0000248b
_LIT16: .word 0x0000563f
_LIT17: .word 0x05000680
_LIT18: .word 0x00007f3f
_LIT19: .word 0x05000660
_LIT20: .word 0x0400006c
_LIT21: .word 0x0400106c
_LIT22: .word 0x04000050
_LIT23: .word data_ov005_021b1e6c
