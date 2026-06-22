; func_0207d90c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207d90c
        .arm
func_0207d90c:
    ldr r2, [r1, #0x8]
    ldr r1, [r1, #0xc]
    cmp r2, #0x0
    strne r1, [r2, #0xc]
    streq r1, [r0]
    cmp r1, #0x0
    strne r2, [r1, #0x8]
    streq r2, [r0, #0x4]
    mov r0, r2
    bx lr
