; func_020058d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern func_02090574
        .global func_020058d4
        .arm
func_020058d4:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1]
    bic r0, r0, #0x1
    bl func_02090574
    ldr r0, _LIT1
    ldr r1, _LIT0
    str r4, [r0, #0x10]
    ldr r0, [r1]
    orr r0, r0, #0x1
    bl func_02090574
    ldmia sp!, {r4, pc}
_LIT0: .word 0x04000210
_LIT1: .word data_02103fcc
