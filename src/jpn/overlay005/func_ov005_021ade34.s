; func_ov005_021ade34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern data_02104e6c
        .extern data_ov005_021b1474
        .extern data_ov005_021b1a84
        .extern data_ov005_021b1a98
        .extern data_ov005_021b1ab4
        .extern data_ov005_021b1ad0
        .extern data_ov005_021b1ae0
        .extern data_ov005_021b1ae8
        .extern data_ov005_021b1b08
        .extern data_ov005_021b1b20
        .extern data_ov005_021b1b38
        .extern data_ov005_021b1b50
        .extern data_ov005_021b1b70
        .extern func_02001cec
        .extern func_02001d64
        .extern func_02004f3c
        .extern func_02005488
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_0201e78c
        .extern func_0201ef3c
        .extern func_0202c06c
        .extern func_02034734
        .extern func_0208ddac
        .extern func_0208dfb8
        .extern func_0208e038
        .extern func_ov005_021aee6c
        .extern func_ov005_021af7e4
        .global func_ov005_021ade34
        .arm
func_ov005_021ade34:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x50
    mov r5, r0
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r3, #0x0
    ldrh r2, [sp, #0x3c]
    ldr r1, [sp, #0x40]
    str r0, [sp, #0x28]
    bic r2, r2, #0xf
    orr r2, r2, #0x3
    strh r2, [sp, #0x3c]
    ldrh r2, [sp, #0x3c]
    bic r0, r1, #0x1c000
    orr r1, r0, #0xc000
    orr r2, r2, #0x10
    add r0, sp, #0x28
    str r3, [sp, #0x34]
    strh r2, [sp, #0x3c]
    strh r3, [sp, #0x38]
    str r1, [sp, #0x40]
    str r3, [sp, #0x30]
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    bl func_0208e038
    ldr r6, _LIT1
    add r2, r0, #0x500
    mov r3, #0x0
.L_d3c:
    add r0, r6, #0x1
    mov r1, r3, lsl #0x1
    add r3, r3, #0x1
    mov r0, r0, lsl #0x10
    strh r6, [r2, r1]
    cmp r3, #0x40
    mov r6, r0, lsr #0x10
    blt .L_d3c
    ldr r0, [r5, #0x8]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_dac
    b .L_d80
    b .L_d90
    b .L_da0
    b .L_d80
    b .L_d80
.L_d80:
    mov r0, #0xf2
    bl func_0202c06c
    mov r4, r0
    b .L_dac
.L_d90:
    mov r0, #0xf4
    bl func_0202c06c
    mov r4, r0
    b .L_dac
.L_da0:
    mov r0, #0xfc
    bl func_0202c06c
    mov r4, r0
.L_dac:
    ldr r0, _LIT2
    mov r1, #0x20
    mov r2, #0x2
    bl func_02001cec
    bl func_0208ddac
    mov r6, r0
    mov r0, r4
    mov r1, #0xc
    bl func_02005488
    rsb r0, r0, #0x100
    add r0, r0, r0, lsr #0x1f
    mov r3, r0, asr #0x1
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    add r2, r6, #0x2fc0
    str r0, [sp, #0x4]
    ldr r0, _LIT2
    mov r1, r4
    add r2, r2, #0x4000
    bl func_02004f3c
    add r0, sp, #0x28
    bl func_0201d428
    bl func_02034734
    cmp r0, #0x2
    ldreq r0, _LIT3
    mov r1, #0x4
    ldrne r0, _LIT4
    mov r2, #0x0
    bl func_02006bf0
    mov r2, #0x0
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x28]
    str r2, [sp, #0x30]
    bic r0, r1, #0xf
    orr r0, r0, #0x4
    strh r0, [sp, #0x3c]
    ldrh r1, [sp, #0x3c]
    add r0, sp, #0x28
    str r2, [sp, #0x34]
    orr r1, r1, #0x10
    strh r1, [sp, #0x3c]
    strh r2, [sp, #0x38]
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT5
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x28]
    mov r0, #0x0
    bic r1, r1, #0xf
    orr r1, r1, #0x8
    strh r1, [sp, #0x3c]
    ldrh r2, [sp, #0x3c]
    ldr r1, [sp, #0x40]
    str r0, [sp, #0x34]
    bic r1, r1, #0x1c000
    orr r2, r2, #0x10
    orr r1, r1, #0xc000
    strh r0, [sp, #0x38]
    str r0, [sp, #0x30]
    add r0, sp, #0x28
    strh r2, [sp, #0x3c]
    str r1, [sp, #0x40]
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    bl func_0208dfb8
    mov r3, #0x0
    add r6, r0, #0xe
    mov ip, #0x2
    mov r2, r3
.L_ee0:
    mov r4, r2
.L_ee4:
    add r0, ip, #0x1
    mov r1, r4, lsl #0x1
    add r4, r4, #0x1
    mov r0, r0, lsl #0x10
    strh ip, [r6, r1]
    cmp r4, #0x13
    mov ip, r0, lsr #0x10
    blt .L_ee4
    add r3, r3, #0x1
    cmp r3, #0x2
    add r6, r6, #0x40
    blt .L_ee0
    mov r0, r5
    bl func_ov005_021aee6c
    mov r0, #0xfe
    bl func_0202c06c
    mov r4, r0
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x2
    bl func_02001cec
    mov r0, r4
    mov r1, #0xc
    bl func_02005488
    rsb r0, r0, #0x20
    add r0, r0, r0, lsr #0x1f
    mov r3, r0, asr #0x1
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    mov r2, #0x6600000
    ldr r0, _LIT2
    mov r1, r4
    add r2, r2, #0x1c80
    bl func_02004f3c
    mov r0, #0xfd
    bl func_0202c06c
    mov r4, r0
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x2
    bl func_02001cec
    ldr r0, _LIT6
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_1060
    ldr r0, _LIT2
    mov r1, #0x10
    mov r2, #0x0
    bl func_02001d64
    mov r0, r4
    mov r1, #0xc
    bl func_02005488
    rsb r0, r0, #0x20
    add r3, r0, r0, lsr #0x1f
    mov r1, #0x2
    mov r2, #0x6600000
    str r1, [sp]
    mov r1, #0xc
    str r1, [sp, #0x4]
    ldr r0, _LIT2
    mov r1, r4
    add r2, r2, #0x1b80
    mov r3, r3, asr #0x1
    bl func_02004f3c
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x2
    bl func_02001cec
    ldr r0, _LIT2
    mov r1, #0xb
    mov r2, #0x0
    bl func_02001d64
    ldr r0, _LIT7
    mov r1, #0xc
    bl func_02005488
    rsb r0, r0, #0x20
    add r0, r0, r0, lsr #0x1f
    mov r3, r0, asr #0x1
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    mov r2, #0x6600000
    ldr r0, _LIT2
    ldr r1, _LIT7
    add r2, r2, #0x1d80
    bl func_02004f3c
    mov r1, #0x0
    ldr r0, _LIT2
    mov r2, r1
    bl func_02001d64
    b .L_109c
.L_1060:
    mov r0, r4
    mov r1, #0xc
    bl func_02005488
    rsb r0, r0, #0x20
    add r3, r0, r0, lsr #0x1f
    mov ip, #0x2
    mov r2, #0x6600000
    mov r1, r4
    ldr r0, _LIT2
    str ip, [sp]
    mov r4, #0xc
    add r2, r2, #0x1b80
    mov r3, r3, asr #0x1
    str r4, [sp, #0x4]
    bl func_02004f3c
.L_109c:
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT8
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x28]
    mov r3, #0xf80
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x3c]
    ldrh r2, [sp, #0x3c]
    mov r1, #0xc0
    add r0, sp, #0x28
    bic r2, r2, #0x10
    str r3, [sp, #0x34]
    strh r2, [sp, #0x3c]
    strh r1, [sp, #0x38]
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT9
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x28]
    mov r0, #0x100
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x3c]
    mov r0, #0xa0
    strh r0, [sp, #0x38]
    add r0, sp, #0x28
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT10
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x28]
    mov r0, #0x300
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x3c]
    mvn r0, #0x0
    strh r0, [sp, #0x38]
    add r0, sp, #0x28
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT11
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x28]
    mov r2, #0x700
    bic r0, r1, #0xf
    orr r3, r0, #0x9
    mvn r1, #0x0
    add r0, sp, #0x28
    strh r3, [sp, #0x3c]
    str r2, [sp, #0x34]
    strh r1, [sp, #0x38]
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT6
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_120c
    ldr r0, _LIT12
    bl func_02006bf0
    str r0, [sp, #0x28]
    b .L_1218
.L_120c:
    ldr r0, _LIT13
    bl func_02006bf0
    str r0, [sp, #0x28]
.L_1218:
    ldrh r0, [sp, #0x3c]
    mov r2, #0xf00
    mvn r1, #0x0
    bic r0, r0, #0xf
    orr r3, r0, #0x9
    add r0, sp, #0x28
    strh r3, [sp, #0x3c]
    str r2, [sp, #0x34]
    strh r1, [sp, #0x38]
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    mov r0, r5
    mov r1, #0x0
    bl func_ov005_021af7e4
    ldr r0, _LIT14
    add r4, sp, #0x18
    ldmia r0, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    bl func_0201e78c
    mov r0, #0x0
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r1, r4
    str r1, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    mov r0, #0x200
    str r0, [sp, #0x10]
    add r0, r5, #0x3c
    str r0, [sp, #0x14]
    ldr r3, _LIT15
    add r0, r5, #0x30
    add r1, r5, #0x34
    add r2, r5, #0x38
    bl func_0201ef3c
    mov r1, #0x4000000
    ldr r0, [r1]
    add r2, r1, #0x1000
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1c00
    str r0, [r1]
    ldr r1, [r2]
    mov r0, #0x1
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1c00
    str r1, [r2]
    add sp, sp, #0x50
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov005_021b1a84
_LIT1: .word 0x0000037e
_LIT2: .word data_02102bb0
_LIT3: .word data_ov005_021b1a98
_LIT4: .word data_ov005_021b1ab4
_LIT5: .word data_ov005_021b1ad0
_LIT6: .word data_02104e6c
_LIT7: .word data_ov005_021b1ae0
_LIT8: .word data_ov005_021b1ae8
_LIT9: .word data_ov005_021b1b08
_LIT10: .word data_ov005_021b1b20
_LIT11: .word data_ov005_021b1b38
_LIT12: .word data_ov005_021b1b50
_LIT13: .word data_ov005_021b1b70
_LIT14: .word data_ov005_021b1474
_LIT15: .word 0x0000ee80
