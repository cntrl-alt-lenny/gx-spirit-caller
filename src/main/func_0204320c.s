; func_0204320c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d9f0
        .extern func_02092748
        .extern func_020927b8
        .global func_0204320c
        .arm
func_0204320c:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r1, [r1]
    add r0, r1, r0
    bl func_020927b8
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r2, [r1]
    add r1, r2, #0x1000
    add r0, r2, r0
    ldr r4, [r1]
    bl func_02092748
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219d9f0
_LIT1: .word 0x000011dc
