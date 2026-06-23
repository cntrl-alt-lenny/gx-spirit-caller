; func_0207d8dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207d8dc
        .arm
func_0207d8dc:
    str r2, [r1, #0x8]
    cmp r2, #0x0
    ldrne r3, [r2, #0xc]
    strne r1, [r2, #0xc]
    ldreq r3, [r0]
    streq r1, [r0]
    str r3, [r1, #0xc]
    cmp r3, #0x0
    strne r1, [r3, #0x8]
    streq r1, [r0, #0x4]
    mov r0, r1
    bx lr
