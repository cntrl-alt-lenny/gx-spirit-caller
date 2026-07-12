; func_ov000_021ac428 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov000_021ac428
        .arm
func_ov000_021ac428:
    ldr r3, [r0, #0x4]
    and r1, r1, #0xff
    bic r3, r3, #0xff0000
    mov r1, r1, lsl #0x18
    orr ip, r3, r1, lsr #0x8
    bic r3, ip, #-16777216
    and r1, r2, #0xff
    orr r1, r3, r1, lsl #0x18
    str r1, [r0, #0x4]
    bx lr
