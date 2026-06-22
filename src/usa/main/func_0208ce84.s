; func_0208ce84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6224
        .extern func_0208dbfc
        .global func_0208ce84
        .arm
func_0208ce84:
    stmdb sp!, {r4, lr}
    ldrh r4, [r0]
    mov r2, #0x0
    ldr r1, _LIT0
    strh r2, [r0]
    ldrh r2, [r1]
    mov r0, r4
    orr r2, r2, r4
    strh r2, [r1]
    bl func_0208dbfc
    mov r0, r4
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a6224
