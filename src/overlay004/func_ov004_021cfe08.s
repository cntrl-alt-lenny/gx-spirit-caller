; func_ov004_021cfe08 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f1c
        .extern data_021a18b8
        .extern data_021a18c0
        .extern data_ov004_02209de0
        .extern data_ov004_02211528
        .extern data_ov004_02211538
        .extern data_ov004_02211544
        .extern data_ov004_02211548
        .extern func_02001bc8
        .extern func_02021064
        .extern func_02021b28
        .extern func_0202c948
        .extern func_0202c9c0
        .extern func_0207deb0
        .extern func_0207e124
        .extern func_0207e370
        .extern func_0208205c
        .extern func_020821e4
        .extern func_02082210
        .extern func_02082234
        .extern func_02082258
        .extern func_0208226c
        .extern func_020822f0
        .extern func_0208232c
        .extern func_02084fe0
        .extern func_0208539c
        .extern func_020853dc
        .extern func_020854e4
        .extern func_0208c8cc
        .extern func_0208c940
        .extern func_0208ced4
        .extern func_0208cee8
        .extern func_0208cefc
        .extern func_0208cf20
        .extern func_0208cf44
        .extern func_0208cf58
        .extern func_0208d3fc
        .extern func_0208d4f0
        .extern func_0208d7ac
        .extern func_0208da2c
        .extern func_0208e5ec
        .extern func_0208ecd8
        .extern func_020931f8
        .extern func_02094550
        .extern func_ov000_021aae34
        .extern func_ov004_021d0168
        .global func_ov004_021cfe08
        .arm
func_ov004_021cfe08:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x34
    bl func_0208cf58
    bl func_0208cf44
    bl func_0208cf20
    bl func_0208cefc
    bl func_0208cee8
    bl func_0208ced4
    mov r0, #0x10
    bl func_0208da2c
    mov r0, #0x40
    bl func_0208d7ac
    mov r0, #0x3
    bl func_0208d4f0
    mov r0, #0x20
    bl func_0208d3fc
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r0
    bl func_0208c8cc
    ldr ip, _LIT0
    ldr r0, _LIT1
    ldrh r1, [ip]
    ldr lr, _LIT2
    mov r5, #0x2
    and r1, r1, r0
    strh r1, [ip]
    ldrh r1, [ip]
    mov r2, r0, lsr #0x11
    ldr r4, _LIT3
    bic r1, r1, #0x3000
    orr r1, r1, #0x10
    strh r1, [ip]
    ldrh r6, [ip]
    mov r0, #0x0
    mov r1, r0
    and r6, r6, lr
    strh r6, [ip]
    ldrh lr, [ip]
    mov r3, #0x3f
    bic lr, lr, #0x3000
    orr lr, lr, #0x8
    strh lr, [ip]
    str r5, [ip, #0x4e0]
    str r4, [ip, #0x520]
    str r0, [sp]
    bl func_0208e5ec
    ldr r1, _LIT4
    ldr r0, _LIT5
    ldr r1, [r1, #0x1c]
    mov r2, #0x4
    bl func_0207deb0
    mov r0, r5
    mov r1, #0x1
    bl func_0207e124
    mov r0, #0x4000
    mov r1, #0x1
    bl func_0207e370
    bl func_020931f8
    bl func_0208232c
    mov r0, #0x400000
    rsb r0, r0, #0x0
    str r0, [sp]
    mov r0, #0x400000
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r0, #0x0
    ldr r2, _LIT6
    str r0, [sp, #0xc]
    str r2, [sp, #0x10]
    mov r1, #0xc0000
    mov r2, r0
    mov r3, #0x100000
    bl func_0208ecd8
    ldr r3, _LIT7
    ldr r0, _LIT8
    ldr r2, [r3, #0xfc]
    mov r1, r0
    bic ip, r2, #0x50
    mov r2, #0x1
    str ip, [r3, #0xfc]
    bl func_02082234
    mov r1, #0x0
    ldr r0, _LIT9
    mov r2, r1
    bl func_02082210
    mov r0, #0x0
    mov r1, r0
    mov r2, r0
    sub r3, r0, #0x1000
    bl func_0208226c
    ldr r1, _LIT8
    mov r0, #0x0
    bl func_02082258
    ldr r1, _LIT10
    mov r0, #0x1
    rsb r2, r1, #0x0
    mov r3, r2
    bl func_0208226c
    ldr r1, _LIT11
    mov r0, #0x1
    bl func_02082258
    ldr r1, _LIT12
    mov r0, r5
    mov r2, r1
    mov r3, r1
    bl func_0208226c
    ldr r1, _LIT11
    mov r0, r5
    bl func_02082258
    mov r0, #0x1f
    str r0, [sp]
    mov r0, #0x800
    mov r1, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x7
    mov r2, r5
    mov r3, r1
    bl func_020821e4
    bl func_020822f0
    bl func_02084fe0
    ldr r2, _LIT13
    ldr r4, _LIT14
    ldrh r1, [r2]
    ldr r0, _LIT15
    bic r1, r1, #0x3
    orr r1, r1, #0x2
    strh r1, [r2]
    bl func_ov000_021aae34
    str r0, [r4]
    bl func_020854e4
    ldrh r1, [r0, #0xe]
    ldr r4, _LIT16
    add r1, r0, r1
    ldr r1, [r1, #0xc]
    add r1, r0, r1
    str r1, [r4]
    ldr r0, _LIT17
    bl func_0208205c
    ldr r0, [r4]
    mov r1, #0x3
    bl func_0208539c
    ldr r0, [r4]
    mov r1, #0x3
    bl func_020853dc
    mov r1, #0x4000000
    ldr r0, [r1]
    bic r0, r0, #0x1f00
    orr r0, r0, #0x300
    str r0, [r1]
    bl func_02021b28
    ldr r0, _LIT18
    mov r1, r5
    str r1, [r0]
    bl func_02021064
    ldr ip, _LIT19
    ldr r1, _LIT20
    ldrh r3, [ip]
    ldr r2, _LIT21
    add r0, sp, #0x14
    bic r3, r3, #0x3
    strh r3, [ip]
    ldrh r3, [ip]
    and r3, r3, #0x43
    orr r3, r3, #0xe00
    strh r3, [ip]
    ldrh r3, [ip, #0x2]
    bic r3, r3, #0x3
    strh r3, [ip, #0x2]
    ldrh r3, [ip, #0x2]
    and r3, r3, #0x43
    orr r3, r3, #0xf00
    strh r3, [ip, #0x2]
    bl func_02001bc8
    ldr r1, _LIT22
    add r0, sp, #0x14
    mov r2, #0x20
    bl func_02094550
    bl func_0208c940
    ldr r3, _LIT23
    mov r0, #0x1
    ldr r2, [r3]
    mov r1, r5
    orr r2, r2, #0x10000
    str r2, [r3]
    bl func_0202c948
    mov r0, #0x1
    bl func_0202c9c0
    mov r0, #0x0
    bl func_ov004_021d0168
    add sp, sp, #0x34
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word 0x04000060
_LIT1: .word 0xffffcffd
_LIT2: .word 0x0000cffb
_LIT3: .word 0xbfff0000
_LIT4: .word data_02104f1c
_LIT5: .word data_ov004_02211528
_LIT6: .word data_021a18c0
_LIT7: .word data_021a18b8
_LIT8: .word 0x00007fff
_LIT9: .word 0x00004210
_LIT10: .word 0x0000093d
_LIT11: .word 0x0000318c
_LIT12: .word 0xfffff6c3
_LIT13: .word 0x04000008
_LIT14: .word data_ov004_02211538
_LIT15: .word data_ov004_02209de0
_LIT16: .word data_ov004_02211544
_LIT17: .word data_ov004_02211548
_LIT18: .word 0x04000540
_LIT19: .word 0x0400000a
_LIT20: .word 0x00003860
_LIT21: .word 0x0000779b
_LIT22: .word 0x050001e0
_LIT23: .word 0x04001000
