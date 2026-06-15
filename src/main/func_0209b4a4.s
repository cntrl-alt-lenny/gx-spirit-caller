; func_0209b4a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a83e4
        .extern func_020937fc
        .extern func_02096234
        .global func_0209b4a4
        .arm
func_0209b4a4:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    ldr r0, [r4]
    cmp r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
.L_18:
    bl func_020937fc
    cmp r0, #0x80
    bne .L_28
    bl func_02096234
.L_28:
    ldr r0, [r4]
    cmp r0, #0x0
    bne .L_18
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a83e4
