; func_ov002_0228b1b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern func_ov002_021c8470
        .extern func_ov002_0227b090
        .global func_ov002_0228b1b8
        .arm
func_ov002_0228b1b8:
    stmfd sp!, {lr}
    sub sp, sp, #0x2c
    ldr r1, _LIT0
    add r2, sp, #0x0
    ldr r0, [r1, #0x4]
    ldr r1, [r1, #0x20]
    bl func_ov002_0227b090
    ldr r1, _LIT0
    ldr r0, [r1]
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c8470
    ldr r1, [sp, #0x18]
    sub r0, r0, #0x190
    cmp r0, r1
    movgt r0, #0x1
    movle r0, #0x0
    add sp, sp, #0x2c
    ldmfd sp!, {pc}
_LIT0: .word data_ov002_022cd3f4
