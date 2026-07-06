; func_ov002_02291050 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b824
        .extern func_0202b86c
        .extern func_ov002_021bbc34
        .extern func_ov002_02281810
        .global func_ov002_02291050
        .arm
func_ov002_02291050:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbc34
    ldrh r1, [r4, #0x2]
    mov r1, r1, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    movls r1, #0x1
    movhi r1, #0x0
    sub r0, r0, r1
    cmp r0, #0x0
    movle r0, #0x1
    ldmleia sp!, {r4, pc}
    ldrh r0, [r4]
    bl func_0202b86c
    cmp r0, #0x4
    bne .L_a4
    ldrh r0, [r4]
    bl func_0202b824
    cmp r0, #0x17
    ldrh r0, [r4, #0x2]
    bne .L_88
    mov r0, r0, lsl #0x1f
    ldr r1, _LIT0
    mov r0, r0, lsr #0x1f
    bl func_ov002_02281810
    cmp r0, #0x0
    beq .L_a4
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_88:
    mov r0, r0, lsl #0x1f
    ldr r1, _LIT1
    mov r0, r0, lsr #0x1f
    bl func_ov002_02281810
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_a4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000019a3
_LIT1: .word 0x000019a4
