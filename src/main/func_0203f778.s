; func_0203f778 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d9d4
        .extern func_02092748
        .extern func_020927b8
        .global func_0203f778
        .arm
func_0203f778:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    ldr r1, _LIT1
    ldr r2, [r2]
    mov r4, r0
    add r0, r2, r1
    bl func_020927b8
    ldr r2, _LIT0
    ldr r1, _LIT1
    ldr r0, [r2]
    add r0, r0, #0x1000
    str r4, [r0, #0x4]
    ldr r0, [r2]
    add r0, r0, r1
    bl func_02092748
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219d9d4
_LIT1: .word 0x000013d8
