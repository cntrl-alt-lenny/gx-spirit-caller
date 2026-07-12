; func_ov000_021abedc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov000_021abedc
        .arm
func_ov000_021abedc:
    ldr r3, [r0, #0x8]
    mov r1, r3, lsl #0x10
    movs r2, r1, lsr #0x10
    bxeq lr
    mov r1, #0x10000
    rsb r1, r1, #0x0
    sub r2, r2, #0x1
    and r3, r3, r1
    mov r1, r2, lsl #0x10
    orr r1, r3, r1, lsr #0x10
    str r1, [r0, #0x8]
    bx lr
