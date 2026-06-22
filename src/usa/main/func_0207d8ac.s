; func_0207d8ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207d8ac
        .arm
func_0207d8ac:
    ldr r3, [r0]
    mov r2, #0x0
    strh r1, [r3]
    strh r2, [r3, #0x2]
    ldr r1, [r0, #0x4]
    add r0, r3, #0x10
    sub r0, r1, r0
    str r0, [r3, #0x4]
    str r2, [r3, #0x8]
    mov r0, r3
    str r2, [r3, #0xc]
    bx lr
