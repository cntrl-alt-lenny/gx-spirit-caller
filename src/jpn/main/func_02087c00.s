; func_02087c00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02087c00
        .arm
func_02087c00:
    ldr ip, [r0]
    cmp ip, #0x0
    bxeq lr
    mov r3, #0x2
    strh r3, [ip, #0x34]
    ldr r3, [r0]
    strh r1, [r3, #0x38]
    ldr r0, [r0]
    strh r2, [r0, #0x3a]
    bx lr
