; func_0207d0a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207d0a4
        .arm
func_0207d0a4:
    ldrh r3, [r0, #0xa]
    mov r2, #0x0
    add ip, r1, r3
    str r2, [ip, #0x4]
    str r2, [r1, r3]
    str r1, [r0]
    str r1, [r0, #0x4]
    ldrh r1, [r0, #0x8]
    add r1, r1, #0x1
    strh r1, [r0, #0x8]
    bx lr
