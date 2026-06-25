; func_020071a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e3c
        .extern func_020057c0
        .extern func_020068fc
        .extern func_02006a1c
        .global func_020071a8
        .arm
func_020071a8:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x10]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r4, pc}
    bl func_020068fc
    bl func_02006a1c
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    beq .L_34
    bl func_020057c0
.L_34:
    ldr r1, [r4, #0x10]
    mov r0, #0x0
    bic r1, r1, #0x2
    str r1, [r4, #0x10]
    str r0, [r4, #0x14]
    ldmia sp!, {r4, pc}
_LIT0: .word data_02104e3c
_LIT1: .word data_02104e3c
