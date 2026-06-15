; func_ov000_021acdcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov000_021acdcc
        .arm
func_ov000_021acdcc:
    ldr ip, [r0, #0x9c]
    and r3, r3, #0xff
    bic ip, ip, #0xff00
    mov r3, r3, lsl #0x18
    orr r3, ip, r3, lsr #0x10
    bic r3, r3, #0xff
    str r3, [r0, #0x9c]
    ldr r3, [r0, #0x80]
    sub r1, r1, r3
    str r1, [r0, #0x90]
    ldr r1, [r0, #0x84]
    sub r1, r2, r1
    str r1, [r0, #0x94]
    ldr r1, [r0, #0x80]
    str r1, [r0, #0x88]
    ldr r1, [r0, #0x84]
    str r1, [r0, #0x8c]
    bx lr
