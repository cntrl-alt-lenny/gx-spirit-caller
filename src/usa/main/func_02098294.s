; func_02098294 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02098294
        .arm
func_02098294:
    mov r3, #0x0
    str r3, [r0]
    ldr r2, [r0]
    mov r1, #0xe
    str r2, [r0, #0x4]
    str r3, [r0, #0x1c]
    ldr r2, [r0, #0x1c]
    str r2, [r0, #0x18]
    str r3, [r0, #0x8]
    str r1, [r0, #0x10]
    str r3, [r0, #0xc]
    bx lr
