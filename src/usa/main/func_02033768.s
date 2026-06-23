; func_02033768 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032adc
        .extern func_02032ba8
        .extern func_02046c1c
        .global func_02033768
        .arm
func_02033768:
    stmdb sp!, {r3, lr}
    mov r2, r0
    ldr r3, [r2, #0xeac]
    mov r0, r1
    bic ip, r3, #0x2000
    bic r1, ip, #0x1000
    bic r3, r1, #0x4000
    bic r1, r3, #0x10000
    bic r1, r1, #0x40000
    str r1, [r2, #0xeac]
    ldr r1, _LIT0
    ldr r3, _LIT1
    str r2, [sp]
    bl func_02046c1c
    ldmia sp!, {r3, pc}
_LIT0: .word func_02032adc
_LIT1: .word func_02032ba8
