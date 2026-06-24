; func_0208f1c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021023bc
        .extern data_021a6240
        .extern func_0208cf48
        .extern func_02093cd4
        .global func_0208f1c0
        .arm
func_0208f1c0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r0, [r0]
    cmp r0, r1
    beq .L_20
    bl func_02093cd4
.L_20:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0208cf48
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021023bc
_LIT1: .word data_021a6240
