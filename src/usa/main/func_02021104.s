; func_02021104 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02194260
        .extern func_020218e0
        .global func_02021104
        .arm
func_02021104:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r1, [r1]
    cmp r1, #0x0
    beq .L_480
    cmp r1, #0x1
    cmpne r1, #0x2
    bne .L_480
    bl func_020218e0
.L_480:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_02194260
_LIT1: .word data_02194260
