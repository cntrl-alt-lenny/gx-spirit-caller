; func_02086718 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02086718
        .arm
func_02086718:
    mov r2, #0x1000
    str r2, [r0]
    str r2, [r0, #0x14]
    mov ip, #0x0
    str ip, [r0, #0x4]
    ldr r3, [r1, #0x24]
    ldrh r2, [r1, #0x2c]
    rsb r3, r3, #0x0
    mul r2, r3, r2
    mov r2, r2, lsl #0x4
    str r2, [r0, #0x30]
    ldrh r2, [r1, #0x2e]
    ldr r1, [r1, #0x28]
    mul r2, r1, r2
    mov r1, r2, lsl #0x4
    str r1, [r0, #0x34]
    str ip, [r0, #0x10]
    bx lr
