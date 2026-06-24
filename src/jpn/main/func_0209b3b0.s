; func_0209b3b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8304
        .extern func_02093714
        .extern func_02096140
        .global func_0209b3b0
        .arm
func_0209b3b0:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    ldr r0, [r4]
    cmp r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
.L_18:
    bl func_02093714
    cmp r0, #0x12
    bne .L_28
    bl func_02096140
.L_28:
    ldr r0, [r4]
    cmp r0, #0x0
    bne .L_18
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a8304
