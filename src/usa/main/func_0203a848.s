; func_0203a848 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b248
        .extern data_0219b2a4
        .extern func_0203a88c
        .extern func_02092660
        .extern func_020926d0
        .global func_0203a848
        .arm
func_0203a848:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, _LIT0
    mov r2, #0x1
    ldr r0, _LIT1
    str r2, [r1]
    bl func_020926d0
    mov r0, r4
    bl func_0203a88c
    ldr r0, _LIT1
    bl func_02092660
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219b248
_LIT1: .word data_0219b2a4
