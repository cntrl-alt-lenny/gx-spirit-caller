; func_0207d960 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207d960
        .arm
func_0207d960:
    add r3, r0, #0x24
    ldr r2, [r0, #0x1c]
    ldr r1, [r3, #0x4]
    subs r1, r2, r1
    movne r0, #0x0
    bxne lr
    ldr r1, [r3]
    str r1, [r0, #0x1c]
    ldr r1, [r0, #0x1c]
    str r1, [r3, #0x4]
    ldr r1, [r0, #0x1c]
    sub r0, r1, r0
    bx lr
