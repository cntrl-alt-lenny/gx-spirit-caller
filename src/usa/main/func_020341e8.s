; func_020341e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b1fc
        .extern func_02032638
        .extern func_02033814
        .extern func_02034134
        .extern func_02046a74
        .global func_020341e8
        .arm
func_020341e8:
    stmdb sp!, {r3, lr}
    bl func_02034134
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_02046a74
    cmp r0, #0x1
    ble .L_ac
    bl func_02032638
    bl func_02033814
.L_ac:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
    ldmia sp!, {r3, pc}
_LIT0: .word data_0219b1fc
