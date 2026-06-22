; func_0206d728 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0206d728
        .arm
func_0206d728:
    ldr r2, [r0, #0x68]
    add r0, r2, #0x100
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    ldr r2, [r2, #0xf8]
    sub r0, r0, r1
    subs r0, r0, #0x1
    addmi r0, r0, r2
    bx lr
