; func_0207d37c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207d37c
        .arm
func_0207d37c:
    add ip, r0, #0x24
    ldrh r3, [ip, #0x12]
    and r1, r1, #0x1
    bic r0, r3, #0x1
    strh r0, [ip, #0x12]
    ldrh r2, [ip, #0x12]
    and r0, r3, #0x1
    mov r0, r0, lsl #0x10
    orr r1, r2, r1
    strh r1, [ip, #0x12]
    mov r0, r0, lsr #0x10
    bx lr
