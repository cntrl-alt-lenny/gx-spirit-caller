; func_0208016c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02081988
        .extern func_02081b48
        .global func_0208016c
        .arm
func_0208016c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, r1
    mov r1, r4
    bl func_02081988
    sub r0, r0, #0x1
    strh r0, [r4, #0x8]
    ldrh r0, [r4, #0x8]
    cmp r0, #0x0
    movne r1, #0x2
    moveq r1, #0x3
    ldr r0, _LIT0
    strh r1, [r4, #0xa]
    str r0, [r4, #0x4]
    ldmia sp!, {r4, pc}
_LIT0: .word func_02081b48
