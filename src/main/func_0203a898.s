; func_0203a898 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b328
        .extern data_0219b384
        .extern func_0203a8dc
        .extern func_02092748
        .extern func_020927b8
        .global func_0203a898
        .arm
func_0203a898:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, _LIT0
    mov r2, #0x1
    ldr r0, _LIT1
    str r2, [r1]
    bl func_020927b8
    mov r0, r4
    bl func_0203a8dc
    ldr r0, _LIT1
    bl func_02092748
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219b328
_LIT1: .word data_0219b384
