; func_02074638 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee2c
        .global func_02074638
        .arm
func_02074638:
    stmdb sp!, {r4, lr}
    ldr r4, [r0, #0xc]
    mov r0, #0x0
    strb r0, [r4, #0x455]
    ldr r0, [r4, #0x824]
    cmp r0, #0x0
    beq .L_28
    ldr r1, _LIT0
    ldr r1, [r1]
    blx r1
.L_28:
    mov r0, #0x0
    str r0, [r4, #0x824]
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_0219ee2c
