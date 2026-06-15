; func_02086c84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02086c84
        .arm
func_02086c84:
    ldr r2, [r1, #0x18]
    mov r3, #0x0
    str r2, [r0]
    ldr r2, [r1, #0x1c]
    str r2, [r0, #0x14]
    str r3, [r0, #0x4]
    str r3, [r0, #0x30]
    ldrh r2, [r1, #0x2e]
    ldr r1, [r1, #0x1c]
    rsb r2, r2, #0x0
    sub r1, r1, #0x1000
    mul r1, r2, r1
    mov r1, r1, lsl #0x4
    str r1, [r0, #0x34]
    str r3, [r0, #0x10]
    bx lr
