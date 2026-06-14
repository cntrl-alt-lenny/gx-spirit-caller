; func_ov011_021cfa50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d4000
        .extern data_ov011_021d403c
        .extern func_ov011_021ca600
        .extern func_ov011_021cc3d4
        .extern func_ov011_021ccf3c
        .extern func_ov011_021cd638
        .global func_ov011_021cfa50
        .arm
func_ov011_021cfa50:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r2, [r1, #0x2b0]
    ldr r4, _LIT2
    and r0, r2, r0
    str r0, [r1, #0x2b0]
    bl func_ov011_021cc3d4
    bl func_ov011_021cd638
    ldr r0, _LIT0
    ldr r1, [r0, #0x2bc]
    orr r1, r1, #0x200
    str r1, [r0, #0x2bc]
    ldr r1, [r0, #0x2a4]
    bic r1, r1, #0x10
    bic r1, r1, #0xf
    str r1, [r0, #0x2a4]
    bl func_ov011_021ccf3c
    ldr r0, _LIT0
    ldr r1, [r0, #0x2ac]
    bic r1, r1, #0x10000000
    str r1, [r0, #0x2ac]
    bl func_ov011_021ca600
    ldr r0, _LIT0
    ldr r0, [r0, #0x2a0]
    cmp r0, #0x0
    beq .L_74
    cmp r0, #0x1
    b .L_88
.L_74:
    ldr r1, _LIT3
    ldrh r0, [r1]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r1]
.L_88:
    ldr r0, [r4, #0x260]
    bic r0, r0, #0x100000
    str r0, [r4, #0x260]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov011_021d4000
_LIT1: .word 0xffe01fff
_LIT2: .word data_ov011_021d403c
_LIT3: .word 0x04000008
