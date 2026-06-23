; func_ov011_021cf98c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern func_ov011_021ca520
        .extern func_ov011_021cc310
        .extern func_ov011_021cce78
        .extern func_ov011_021cd574
        .global func_ov011_021cf98c
        .arm
func_ov011_021cf98c:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r2, [r1, #0x2b0]
    ldr r4, _LIT2
    and r0, r2, r0
    str r0, [r1, #0x2b0]
    bl func_ov011_021cc310
    bl func_ov011_021cd574
    ldr r0, _LIT0
    ldr r1, [r0, #0x2bc]
    orr r1, r1, #0x200
    str r1, [r0, #0x2bc]
    ldr r1, [r0, #0x2a4]
    bic r1, r1, #0x10
    bic r1, r1, #0xf
    str r1, [r0, #0x2a4]
    bl func_ov011_021cce78
    ldr r0, _LIT0
    ldr r1, [r0, #0x2ac]
    bic r1, r1, #0x10000000
    str r1, [r0, #0x2ac]
    bl func_ov011_021ca520
    ldr r0, _LIT0
    ldr r0, [r0, #0x2a0]
    cmp r0, #0x0
    beq .L_6e8
    cmp r0, #0x1
    b .L_6fc
.L_6e8:
    ldr r1, _LIT3
    ldrh r0, [r1]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r1]
.L_6fc:
    ldr r0, [r4, #0x260]
    bic r0, r0, #0x100000
    str r0, [r4, #0x260]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word 0xffe01fff
_LIT2: .word data_ov011_021d3f5c
_LIT3: .word 0x04000008
