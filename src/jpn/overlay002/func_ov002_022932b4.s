; func_ov002_022932b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b8cc
        .extern func_ov002_021afa94
        .extern func_ov002_02280594
        .global func_ov002_022932b4
        .arm
func_ov002_022932b4:
    stmdb sp!, {r3, lr}
    ldrh r3, [r0, #0x2]
    ldrh r1, [r0]
    mov r2, #0x0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02280594
    cmp r0, #0x0
    blt .L_1d8
    bl func_ov002_021afa94
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8cc
    ldr r1, _LIT0
    cmp r0, r1
    movgt r0, #0x1
    ldmgtia sp!, {r3, pc}
.L_1d8:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000708
