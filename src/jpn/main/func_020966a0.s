; func_020966a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020966a0
        .arm
func_020966a0:
    ldr r1, [r0, #0x30]
    str r1, [r0, #0x24]
    ldr r1, [r0, #0x30]
    str r1, [r0, #0x2c]
    ldr r1, [r0, #0x34]
    str r1, [r0, #0x28]
    ldr r1, [r0, #0x38]
    str r1, [r0, #0x20]
    mov r0, #0x0
    bx lr
