; func_ov002_0221520c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bb83c
        .extern func_ov002_02210720
        .global func_ov002_0221520c
        .arm
func_ov002_0221520c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r4, r1
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x23
    beq .L_bf8
    ldr r0, _LIT0
    bl func_ov002_021bb83c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_bf8:
    mov r0, r5
    mov r1, r4
    bl func_ov002_02210720
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x0000128b
