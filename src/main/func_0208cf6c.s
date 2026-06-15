; func_0208cf6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6304
        .extern func_0208dce4
        .global func_0208cf6c
        .arm
func_0208cf6c:
    stmdb sp!, {r4, lr}
    ldrh r4, [r0]
    mov r2, #0x0
    ldr r1, _LIT0
    strh r2, [r0]
    ldrh r2, [r1]
    mov r0, r4
    orr r2, r2, r4
    strh r2, [r1]
    bl func_0208dce4
    mov r0, r4
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a6304
