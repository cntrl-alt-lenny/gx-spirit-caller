; func_0203a4d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b248
        .extern data_0219b2a4
        .extern func_0203a320
        .extern func_02092660
        .extern func_020926d0
        .global func_0203a4d0
        .arm
func_0203a4d0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, _LIT0
    mov r3, #0x1
    ldr r0, _LIT1
    mov r4, r1
    str r3, [r2]
    bl func_020926d0
    mov r0, r5
    mov r1, r4
    mov r2, #0x0
    bl func_0203a320
    mov r4, r0
    ldr r0, _LIT1
    bl func_02092660
    ldr r1, _LIT0
    mov r2, #0x0
    mov r0, r4
    str r2, [r1]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_0219b248
_LIT1: .word data_0219b2a4
