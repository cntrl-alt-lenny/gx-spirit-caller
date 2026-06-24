; func_0202d140 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ac68
        .extern func_0201d4dc
        .extern func_02094410
        .global func_0202d140
        .arm
func_0202d140:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x6c]
    bl func_0201d4dc
    add r0, r0, #0x4e0
    ldr r2, _LIT1
    add r1, r0, #0x2000
    mov r0, #0x0
    bl func_02094410
    ldr r0, _LIT0
    mov r1, #0x1
    str r4, [r0, #0x18]
    str r1, [r0, #0x14]
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219ac68
_LIT1: .word 0x00002d20
