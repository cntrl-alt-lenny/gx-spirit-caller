; func_02034238 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b2dc
        .extern func_0203268c
        .extern func_02033864
        .extern func_02034184
        .extern func_02046ae0
        .global func_02034238
        .arm
func_02034238:
    stmdb sp!, {r3, lr}
    bl func_02034184
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_02046ae0
    cmp r0, #0x1
    ble .L_ac
    bl func_0203268c
    bl func_02033864
.L_ac:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
    ldmia sp!, {r3, pc}
_LIT0: .word data_0219b2dc
