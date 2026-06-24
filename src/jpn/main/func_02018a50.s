; func_02018a50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern func_0202adc8
        .extern func_0202aeec
        .extern func_0202ba40
        .global func_02018a50
        .arm
func_02018a50:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r0, [r2, #0x4]
    mov r4, r1
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202adc8
    mov r0, r5
    mov r1, r4
    bl func_0202ba40
    bl func_0202aeec
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104e6c
