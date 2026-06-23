; func_ov004_021ca418 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4634
        .extern data_02102bb0
        .extern data_02103fcc
        .extern data_02104e6c
        .extern data_ov004_0220987c
        .extern data_ov004_0220988c
        .extern data_ov004_022098a8
        .extern data_ov004_022098c4
        .extern data_ov004_022098dc
        .extern data_ov004_022098f4
        .extern data_ov004_0220990c
        .extern data_ov004_02209924
        .extern data_ov004_0220993c
        .extern data_ov004_02209958
        .extern data_ov004_0220b2a0
        .extern data_ov004_02211198
        .extern func_02001ba8
        .extern func_02001cec
        .extern func_02001d48
        .extern func_02001e74
        .extern func_02004f3c
        .extern func_02005488
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201d56c
        .extern func_0201e564
        .extern func_0202c06c
        .extern func_0203737c
        .extern func_0208c858
        .extern func_0208cdec
        .extern func_0208ce00
        .extern func_0208ce14
        .extern func_0208ce38
        .extern func_0208ce5c
        .extern func_0208ce70
        .extern func_0208d60c
        .extern func_0208d6c4
        .extern func_0208d7d8
        .extern func_0208d944
        .extern func_0208dd04
        .extern func_0208ddac
        .extern func_0208de24
        .extern func_0208e0e4
        .extern func_02094410
        .extern func_0209445c
        .extern func_ov004_021c9eec
        .global func_ov004_021ca418
        .arm
func_ov004_021ca418:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x78
    ldr r4, _LIT0
    bl func_0208ce70
    bl func_0208ce5c
    bl func_0208ce38
    bl func_0208ce14
    bl func_0208ce00
    bl func_0208cdec
    mov r0, #0x2
    bl func_0208d944
    mov r0, #0x1
    bl func_0208d7d8
    mov r0, #0x40
    bl func_0208d6c4
    mov r0, #0x20
    bl func_0208d60c
    mov r3, #0x4000000
    ldr r2, [r3]
    ldr r1, _LIT1
    mov r0, #0x4
    and r1, r2, r1
    orr r1, r1, #0x10
    orr r1, r1, #0x200000
    str r1, [r3]
    mov r1, #0x2
    bl func_0201d56c
    mov r0, #0x0
    str r0, [sp]
    ldr r0, _LIT2
    ldr r1, _LIT3
    mov r2, #0x1
    mov r3, #0x3400
    bl func_ov004_021c9eec
    add r0, sp, #0x50
    bl func_0201d428
    ldr r0, _LIT4
    mov r1, #0x4
    ldr r0, [r0, #0x40]
    mov r2, #0x0
    cmp r0, #0x0
    ldrne r0, _LIT5
    ldreq r0, _LIT6
    bl func_02006bf0
    mov r2, #0x0
    ldrh r1, [sp, #0x64]
    str r0, [sp, #0x50]
    str r2, [sp, #0x5c]
    bic r0, r1, #0xf
    orr r0, r0, #0x4
    strh r0, [sp, #0x64]
    ldrh r1, [sp, #0x64]
    add r0, sp, #0x50
    strh r2, [sp, #0x60]
    orr r1, r1, #0x10
    strh r1, [sp, #0x64]
    bl func_0201e564
    ldr r0, [sp, #0x50]
    bl func_02006e00
    ldr r2, _LIT7
    mov r0, #0x0
    ldrh r1, [r2]
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [r2]
    str r0, [r2, #0xe]
    ldrh r0, [r2]
    and r0, r0, #0x43
    orr r0, r0, #0x284
    orr r0, r0, #0x400
    strh r0, [r2]
    bl func_0208dd04
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x40
    bl func_02094410
    ldr r2, _LIT8
    mov r0, #0x0
    ldrh r1, [r2]
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [r2]
    str r0, [r2, #0xc]
    ldrh r0, [r2]
    and r0, r0, #0x43
    orr r0, r0, #0x490
    strh r0, [r2]
    bl func_0208ddac
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x40
    bl func_02094410
    ldr r0, [r4, #0x40]
    mov r5, #0x40
    cmp r0, #0x0
    add r0, sp, #0x28
    beq .L_348
    bl func_0201d428
    ldr r0, _LIT9
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldrh r1, [sp, #0x3c]
    mov r3, #0x0
    ldr r2, [sp, #0x40]
    bic r1, r1, #0xf
    orr r1, r1, #0x3
    strh r1, [sp, #0x3c]
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x28]
    bic r0, r2, #0x1c000
    orr r2, r0, #0xc000
    orr r1, r1, #0x10
    add r0, sp, #0x28
    str r5, [sp, #0x34]
    str r3, [sp, #0x30]
    str r2, [sp, #0x40]
    strh r1, [sp, #0x3c]
    strh r3, [sp, #0x38]
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
    mov r0, #0x1840
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    bic r0, r1, #0xf
    orr r0, r0, #0x2
    strh r0, [sp, #0x3c]
    add r0, r4, #0xd8
    add r0, r0, #0x5400
    str r0, [sp, #0x30]
    ldrh r0, [sp, #0x3c]
    ldr r1, [sp, #0x40]
    orr r0, r0, #0x10
    bic r1, r1, #0x1c000
    strh r0, [sp, #0x3c]
    mov r0, #0x0
    orr r1, r1, #0x8000
    strh r0, [sp, #0x38]
    add r0, sp, #0x28
    str r1, [sp, #0x40]
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT11
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x28]
    mov r0, r5
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    bic r0, r1, #0xf
    orr r0, r0, #0x2
    strh r0, [sp, #0x3c]
    add r0, r4, #0xd8
    add r0, r0, #0x5c00
    str r0, [sp, #0x30]
    ldr r0, [sp, #0x40]
    bic r0, r0, #0x1c000
    orr r0, r0, #0x8000
    str r0, [sp, #0x40]
    ldrh r2, [sp, #0x3c]
    mov r1, #0x200
    add r0, sp, #0x28
    orr r2, r2, #0x10
    strh r2, [sp, #0x3c]
    strh r1, [sp, #0x38]
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT12
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x28]
    ldr r2, [sp, #0x40]
    bic r0, r1, #0xf
    orr r0, r0, #0x2
    strh r0, [sp, #0x3c]
    add r0, r4, #0x1d8
    add r0, r0, #0x5c00
    str r0, [sp, #0x30]
    bic r0, r2, #0x1c000
    ldrh r1, [sp, #0x3c]
    orr r0, r0, #0x8000
    str r0, [sp, #0x40]
    orr r2, r1, #0x10
    mov r1, #0xc40
    str r1, [sp, #0x34]
    mov r1, #0x400
    add r0, sp, #0x28
    strh r2, [sp, #0x3c]
    strh r1, [sp, #0x38]
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    b .L_494
.L_348:
    bl func_0201d428
    ldr r0, _LIT13
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldrh r1, [sp, #0x3c]
    mov r3, #0x0
    ldr r2, [sp, #0x40]
    bic r1, r1, #0xf
    orr r1, r1, #0x3
    strh r1, [sp, #0x3c]
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x28]
    bic r0, r2, #0x1c000
    orr r2, r0, #0xc000
    orr r1, r1, #0x10
    add r0, sp, #0x28
    str r5, [sp, #0x34]
    str r3, [sp, #0x30]
    str r2, [sp, #0x40]
    strh r1, [sp, #0x3c]
    strh r3, [sp, #0x38]
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT14
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x28]
    mov r0, r5
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    bic r0, r1, #0xf
    orr r0, r0, #0x2
    strh r0, [sp, #0x3c]
    add r0, r4, #0xd8
    add r0, r0, #0x5400
    str r0, [sp, #0x30]
    ldrh r0, [sp, #0x3c]
    ldr r1, [sp, #0x40]
    orr r0, r0, #0x10
    bic r1, r1, #0x1c000
    strh r0, [sp, #0x3c]
    mov r0, #0x0
    orr r1, r1, #0x8000
    strh r0, [sp, #0x38]
    add r0, sp, #0x28
    str r1, [sp, #0x40]
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT15
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldr r1, _LIT16
    str r0, [sp, #0x28]
    add r0, r4, #0xd8
    add r0, r0, #0x5800
    str r0, [sp, #0x30]
    ldr r0, [sp, #0x40]
    ldrh r2, [sp, #0x3c]
    str r1, [sp, #0x34]
    bic r0, r0, #0x1c000
    bic r1, r2, #0xf
    orr r1, r1, #0x2
    strh r1, [sp, #0x3c]
    ldrh r2, [sp, #0x3c]
    orr r0, r0, #0x8000
    str r0, [sp, #0x40]
    mov r1, #0x200
    orr r2, r2, #0x10
    add r0, sp, #0x28
    strh r2, [sp, #0x3c]
    strh r1, [sp, #0x38]
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
.L_494:
    ldr r2, _LIT17
    mov r0, #0x0
    ldrh r1, [r2]
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [r2]
    str r0, [r2, #0xa]
    ldrh r0, [r2]
    and r0, r0, #0x43
    orr r0, r0, #0x21c
    strh r0, [r2]
    bl func_0208de24
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x20
    bl func_02094410
    ldr r1, _LIT18
    ldr r2, _LIT19
    add r0, sp, #0x8
    bl func_02001ba8
    ldr r1, _LIT20
    add r0, sp, #0x8
    mov r2, #0x20
    bl func_0209445c
    ldr r0, _LIT21
    mov r1, #0x5000000
    mov r2, #0x20
    bl func_0209445c
    ldr r0, _LIT22
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r0, _LIT23
    mov r1, #0x20
    mov r2, #0x2
    bl func_02001cec
    ldr r0, [r4, #0x40]
    add r0, r0, #0xca
    add r0, r0, #0x300
    bl func_0202c06c
    mov r5, r0
    bl func_0208de24
    mov r4, r0
    mov r0, #0x0
    add r1, r4, #0x20
    mov r2, #0x800
    bl func_02094410
    mov r0, r5
    mov r1, #0xc
    bl func_02005488
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r3, r0, #0x80
    mov r0, #0x4
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT23
    mov r1, r5
    add r2, r4, #0x20
    bl func_02004f3c
    bl func_0208e0e4
    add r1, r0, #0x4c0
    ldr r0, _LIT23
    mov r2, #0x1
    mov r3, #0x2
    bl func_02001e74
    mov r1, #0x4000000
    ldr r0, [r1]
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1e00
    str r0, [r1]
    bl func_0208c858
    ldr r4, _LIT24
    mov r2, #0x0
    ldr r0, [r4, #0xb7c]
    sub r3, r2, #0x1
    str r0, [r4, #0xb80]
    mov r0, #0x27
    mov r1, #0x1
    str r0, [r4, #0xb7c]
    bl func_0203737c
    add sp, sp, #0x78
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word 0xffcfffef
_LIT2: .word data_ov004_02211198
_LIT3: .word data_ov004_0220987c
_LIT4: .word data_ov004_0220b2a0
_LIT5: .word data_ov004_0220988c
_LIT6: .word data_ov004_022098a8
_LIT7: .word 0x0400000e
_LIT8: .word 0x0400000c
_LIT9: .word data_ov004_022098c4
_LIT10: .word data_ov004_022098dc
_LIT11: .word data_ov004_022098f4
_LIT12: .word data_ov004_0220990c
_LIT13: .word data_ov004_02209924
_LIT14: .word data_ov004_0220993c
_LIT15: .word data_ov004_02209958
_LIT16: .word 0x00004040
_LIT17: .word 0x0400000a
_LIT18: .word 0x00003860
_LIT19: .word 0x0000779b
_LIT20: .word 0x05000040
_LIT21: .word data_020b4634
_LIT22: .word data_02104e6c
_LIT23: .word data_02102bb0
_LIT24: .word data_02103fcc
